library(scriptexec)
context("is_windows")

describe("execute", {
    it("is_windows", {
        windows <- scriptexec::is_windows()
        expect_equal(windows, .Platform$OS.type == "windows")
    })
})
