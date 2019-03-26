# test_setff.R
# Tests of binding value to name.
# Author: Vince Reuter
# Email: vpr9v@virginia.edu

context("setff")

test_that("there is no double slashes in the produced path",  {
  ns = c("NEWPROCVAR", "RAND_DATA_VAR", "ProcData", "RawData")
  xs = c("test/path", "//test/path", "/test/path//", "testpath//")
  if (length(ns) != length(xs)) stop(sprintf(
    "%d names and %d values as test inputs", length(ns), length(xs)))
  for (i in 1:length(ns)) {
    expect_true(.isEmpty(optOrEnvVar(!!ns[i])))
    setff(ns[i], path = xs[i])
    expect_false(grepl(pattern="//", x=eval(get(paste0(.FFTAGFUNC, !!ns[i]))())))
    cleanFfSetting(ns[i])
  }
})

test_that("result of function created matches value provided",  {
	ns = c("NEWPROCVAR", "RAND_DATA_VAR", "ProcData", "RawData", "ROUT.DIR", "PROCESSED.PROJECT")
	xs = c("processed", "/home/data", "proc/data", "RawData", "output", "proc_proj")
	if (length(ns) != length(xs)) stop(sprintf(
		"%d names and %d values as test inputs", length(ns), length(xs)))
	for (i in 1:length(ns)) {
		expect_true(.isEmpty(optOrEnvVar(!!ns[i])))
		setff(ns[i], path = xs[i])
		expect_equal(eval(get(paste0(.FFTAGFUNC, !!ns[i]))()), !!xs[i])
		cleanFfSetting(ns[i])
	}
})

test_that("setting explicit empty is prohibited", {
	vals = list(NULL, "", character(0), logical(0), numeric(0), integer(0))
	varnames = lapply(1:length(vals), getRandVarName)
	for (i in 1:length(vals)) {
		expect_error(setff(!!varnames[[i]], path = !!vals[[i]]))
	}
})

test_that("attempt to derive value from empty varname is prohibited", {
	vals = list(NULL, "", character(0), logical(0), numeric(0), integer(0))
	varnames = lapply(1:length(vals), getRandVarName)
	for (i in 1:length(vals)) {
		expect_error(setff(!!varnames[[i]], currVal = !!vals[[i]]))
	}
})

test_that("explicit value or variable is required", {
	varnames = sapply(1:10, getRandVarName)
	for (i in 1:length(varnames)) { expect_error(setff(!!varnames[i])) }
})

test_that("explicit value trumps variable, and using both emits warning", {
	fixed = "explicit"
	target = "DUMMY_TEST_VAR"
	varnames = sapply(1:10, getRandVarName)
	for (i in 1:length(varnames)) {
		expect_warning(setff(target, path = fixed, pathVar = varnames[i]))
		func = paste0(.FFTAGFUNC, "DUMMY_TEST_VAR")
		expect_equal(eval(get(func)()), fixed)
		cleanFfSetting(target)
	}
})

test_that("name to set can be interpreted as environment variable holding value", {
	varVal = "dummyTestValue"
	checkClean = function(vn) { if (!identical("", Sys.getenv(vn))) {
		stop(sprintf("Name %s is already set as env var: %s", vn, Sys.getenv(vn))) } }
	for (n in sapply(1:10, getRandVarName)) {
		checkClean(n)
		envArg = list(varVal)
		names(envArg) = n
		do.call(what = Sys.setenv, args = envArg)
		if (identical("", Sys.getenv(n))) stop("Failed to set env var: ", n)
		setff(n)
		expect_equal(get(paste0(.FFTAGFUNC, !!n))(), varVal)
		cleanFfSetting(n)
		Sys.unsetenv(n)
		checkClean(n)
	}
})

test_that("name to set can be interpreted as name of current option holding value", {
	varVal = "optionValueTest"
	checkClean = function(opt) { if (!is.null(getOption(opt))) {
		stop(sprintf("Option %s is already set", opt)) } }
	for (n in sapply(1:10, getRandVarName)) {
		checkClean(n)
		optArg = list(varVal)
		names(optArg) = n
		options(optArg)
		if (is.null(getOption(n))) stop("Failed to set option: ", n)
		setff(n)
		expect_equal(get(paste0(.FFTAGFUNC, !!n))(), varVal)
		cleanFfSetting(n)
		optArg = list(NULL)
		names(optArg) = n
		options(optArg)
		checkClean(n)
	}
})

test_that("Option lookup is case insensitive", {
	minLen = 10
	maxLen = 20
	var = getRandVarName(minLen=minLen, maxLen=maxLen)
	val = "dummy_test_val"
	typesAlwaysFound = c("tolower", "toupper")
	caseTypes = c("tomixed", typesAlwaysFound)
	for (setType in caseTypes) {
		for (useType in caseTypes) {
			setVar = get(setType)(var)
			neitherOptNorEnvVar(setVar)
			useVar = if (useType == setType) setVar else get(useType)(var)
			neitherOptNorEnvVar(useVar)
			optArg = list(val)
			names(optArg) = setVar
			options(optArg)
			if (is.null(getOption(setVar))) stop("Failed to set option: ", setVar)
			if (setType %in% typesAlwaysFound || setType == useType) { expect_equal(setff(!!useVar)(), val) }
			else { expect_error(setff(!!useVar)(), "Attempted to set empty value *") }
			optArg = list(NULL)
			names(optArg) = setVar
			options(optArg)
			neitherOptNorEnvVar(setVar)
			validateFfCleanup(useVar)
		}
	}
})

test_that("Environment variable lookup is case insensitive", {
	# Windows and MACOS have case-insensitive file systems.
	skip_on_os("windows")
	skip_on_os("mac")	
	minLen = 10
	maxLen = 20
	var = getRandVarName(minLen=minLen, maxLen=maxLen)
	val = "dummy_test_val"
	typesAlwaysFound = c("tolower", "toupper")
	caseTypes = c("tomixed", typesAlwaysFound)
	for (setType in caseTypes) {
		for (useType in caseTypes) {
			setVar = get(setType)(var)
			neitherOptNorEnvVar(setVar)
			useVar = if (useType == setType) setVar else get(useType)(var)
			neitherOptNorEnvVar(useVar)
			envArg = list(val)
			names(envArg) = setVar
			do.call(what=Sys.setenv, args=envArg)
			if (identical("", Sys.getenv(setVar))) stop("Failed to set env var: ", setVar)
			if (setType %in% typesAlwaysFound || setType == useType) { expect_equal(setff(!!useVar)(), val) }
			else { expect_error(setff(!!useVar)(), "Attempted to set empty value *") }
			Sys.unsetenv(setVar)
			neitherOptNorEnvVar(setVar)
			validateFfCleanup(useVar)
		}
	}
})

test_that("Exact name lookup precedes case variation", {
	# Windows and MACOS have case-insensitive file systems.
	skip_on_os("windows")
	skip_on_os("mac")
	exactVal = "exact"
	upperVal = "upper"
	lowerVal = "lower"
	for (var in sapply(1:5, getRandVarName)) {
		mixedVar = tomixed(var)
		upperVar = toupper(var)
		lowerVar = tolower(var)
		allVars = c(mixedVar, upperVar, lowerVar)
		for (v in allVars) { neitherOptNorEnvVar(v) }
		for (nameType in c("opt", "envVar")) {
			if (nameType == "opt") {
				setVar = function(k, v) {
					optArg = list(v)
					names(optArg) = k
					options(optArg)
				}
				check = function(k) { 
					if (is.null(getOption(k))) { stop("Failed to set option: ", k) }
				}
				clean = function(k) {
					optArg = list(NULL)
					names(optArg) = k
					options(optArg)
				}
			} else if (nameType == "envVar") {
				setVar = function(k, v) {
					envArg = list(v)
					names(envArg) = k
					do.call(what=Sys.setenv, args=envArg)
				}
				check = function(k) {
					if (identical("",  Sys.getenv(k))) { stop("Failed to set env var: ", k) }
				}
				clean = function(k) { Sys.unsetenv(k) }
			} else { stop("Invalid name type: ", nameType) }
			setVar(mixedVar, exactVal)
			setVar(upperVar, upperVal)
			setVar(lowerVar, lowerVal)
			for (v in allVars) { check(v) }
			expect_equal(setff(mixedVar)(), exactVal)
			for (v in allVars) {
				clean(v)
				neitherOptNorEnvVar(v)
				validateFfCleanup(v)
			}
		}
	}
})


test_that("Bad user input is ignored", {
	sep = .Platform$file.sep
	setff("Code", tempdir())
	expect_equal(ffCode(), tempdir())
	expect_equal(ffCode("dir"), paste(tempdir(), "dir", sep=sep))
	expect_equal(ffCode("dir", "dir2"), paste(tempdir(), "dir", "dir2", sep=sep))
	expect_equal(ffCode("dir", sep, "dir2", sep, sep, "dir3"),
		paste(tempdir(), "dir", "dir2", "dir3", sep=sep))
	expect_equal(ffCode("dir", "dir2", "dir3", character(0)),
		file.path(tempdir(), "dir", "dir2", "dir3", ""))

})

