context("get_platform_value")

describe("get_platform_value", {
    source("helper.R")

    it("text", {
        output <- scriptexec::get_platform_value("unix", "windows")

        os_value <- get_os_string("unix", "windows")
        expect_equal(output, os_value)
    })
})
