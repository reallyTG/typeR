context("build_output")

describe("build_output", {
    source("helper.R")

    it("status available", {
        output <- c("line 1", "\n", "line 2")
        attr(output, "status") <- 15
        script_output <- scriptexec::build_output(output, wait = TRUE)

        expect_equal(script_output$status, 15)
        expect_equal(script_output$output, "line 1\nline 2")
        expect_true(is.null(attr(script_output, "error")))
    })

    it("status null wait", {
        output <- c("line 1", "\n", "line 2")
        script_output <- scriptexec::build_output(output, wait = TRUE)

        expect_equal(script_output$status, 0)
        expect_equal(script_output$output, "line 1\nline 2")
        expect_true(is.null(attr(script_output, "error")))
    })

    it("status null nowait", {
        output <- c("line 1", "\n", "line 2")
        script_output <- scriptexec::build_output(output, wait = FALSE)

        expect_equal(script_output$status, -1)
        expect_equal(script_output$output, "line 1\nline 2")
        expect_true(is.null(attr(script_output, "error")))
    })

    it("errmsg", {
        output <- c("line 1", "\n", "line 2")
        attr(output, "errmsg") <- "error message"
        script_output <- scriptexec::build_output(output, wait = TRUE)

        expect_equal(script_output$status, 0)
        expect_equal(script_output$output, "line 1\nline 2")
        expect_equal(script_output$error, "error message")
    })
})
