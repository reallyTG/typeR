context("on_invoke_error")

describe("on_invoke_error", {
    source("helper.R")

    it("error provided", {
        output <- scriptexec::on_invoke_error("error message")

        expect_equal(attr(output, "status"), 1)
        expect_equal(attr(output, "errmsg"), "error message")
    })
})
