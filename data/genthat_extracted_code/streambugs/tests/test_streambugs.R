library(streambugs)
context("streambugs")


# Note: cannot put model simulation into helper_run_minimum_example.R because,
#       then it is also run with devtools::document()
if (!exists("minimum.example.setup")) {
    minimum.example <- new.env()
    source("run_minimum_example.R", local=minimum.example)
    minimum.example.setup <- TRUE
}


#' Read reference CSV simulation results and compare with the simulated ones.
.expect_equal_res_matrices <- function(csv.expected, res.matrix) {
    res.expected = as.matrix(read.csv(csv.expected))
    expect_equal(dim(res.expected),dim(res.matrix))
    expect_equal(colnames(res.expected), colnames(res.matrix))
    # compare values with rel. tolerance of 1e-6
    vec.expected = as.vector(unlist(res.expected))
    vec.matrix = as.vector(unlist(res.matrix))
    vec.rel.err = mapply(function(x,y) if (x == 0) abs(y) else abs((x-y)/x), vec.expected, vec.matrix)
    vec.zero = rep(0,prod(dim(res.expected)))
    expect_equal(vec.rel.err, vec.zero, tolerance=1e-6)
}

test_that("check minimum example numerical solution", {
    .expect_equal_res_matrices("minimum_example_res_R.csv", minimum.example$res.R$res)
    .expect_equal_res_matrices("minimum_example_res_C.csv", minimum.example$res.C$res)
    # TODO: if different from streambugs.{get,write}.sys.def then add
    #       file.{def,res,add} options to run.streambugs and compare files
    #       contents

})

.streambugs.sys.def.warning.handler <- function(w) {
    if(any(grepl("no (envcond|parameters) for .*", w))) {
        invokeRestart("muffleWarning")
    }
}

#' Plot to PDF and test if PDF has same size as the reference. Cleanup
#' afterwards.
.expect_equal_pdf_size <- function(res.list,
        pdf.size.expected = file.info("minimum_example_res.pdf")$size) {
    res.pdf <- "minimum_example_res_temp.pdf"
    pdf(res.pdf,width=8,height=6)
    withCallingHandlers(
        plot.streambugs(res.list$res,res.list$args$par,res.list$args$inp),
        warning = .streambugs.sys.def.warning.handler
    )
    dev.off()
    tryCatch({
            # 0.5% tolerance for an OS-dependent PDF size variation
            expect_equal(pdf.size.expected, file.info(res.pdf)$size, tolerance=0.005*pdf.size.expected)
        },
        finally={
            file.remove(res.pdf)
        }
    )
}

test_that("check minimum example plots", {
    .expect_equal_pdf_size(minimum.example$res.R)
    .expect_equal_pdf_size(minimum.example$res.R)
})

.read.file.to.char <- function(file.name) {
    # standardize EOLs: Windows to Unix
    gsub('\r\n', '\n', readChar(file.name, file.info(file.name)$size))
}

.expect_equal_dat_file <- function(res.list,
        dat.char.expected = .read.file.to.char("minimum_example_sysdef.dat")) {
    # streambugs.get.sys.def
    sys.def <- withCallingHandlers(
        streambugs.get.sys.def(y.names=res.list$args$y.names,
            par=res.list$args$par, inp=res.list$args$inp),
        warning = .streambugs.sys.def.warning.handler
    )
    # streambugs.write.sys.def
    res.dat <- "minimum_example_sysdef_temp.dat"
    streambugs.write.sys.def(sys.def, file=res.dat)
    # read both files to string and compare
    tryCatch({
            expect_equal(dat.char.expected, .read.file.to.char(res.dat))
        },
        finally={
            file.remove(res.dat)
        }
    )
}

test_that("check minimum example system defintion", {
    .expect_equal_dat_file(minimum.example$res.R)
    .expect_equal_dat_file(minimum.example$res.C)
})
