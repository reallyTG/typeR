## Run unit tests
## Charlie Redmon
## 20170802

if (!require("RUnit", quietly = TRUE)) {
  warning("Cannot run unit tests. Package RUnit is not available.")
  q('no')
}

library(kutils)

path <- system.file(package="kutils", "unitTests")
stopifnot(file.exists(path), file.info(path.expand(path))$isdir)

testsuite.variableKey <- defineTestSuite("VariableKey",
                                         dirs=path,
                                         testFileRegexp="^runit.+\\.R",
                                         testFuncRegexp="^test.+",
                                         rngKind="Marsaglia-Multicarry",
                                         rngNormalKind="Kinderman-Ramage")

testResult <- runTestSuite(testsuite.variableKey)
printTextProtocol(testResult, showDetails=TRUE)

tmp <- getErrors(testResult)
if (tmp$nFail > 0 | tmp$nErr > 0) {
  stop(paste0("\n\nUnit testing failed (", tmp$nFail, " test failures), ",
              tmp$nErr, " R errors)\n\n"))
}
