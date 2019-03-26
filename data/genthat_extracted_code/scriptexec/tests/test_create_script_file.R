context("create_script_file")

describe("create_script_file", {
    source("helper.R")

    it("no text", {
        filename <- scriptexec::create_script_file()
        extension <- get_os_string(".sh", ".bat")

        found <- grepl(extension, filename)
        expect_true(found)

        text <- readLines(filename)
        expect_equal(text, "")
    })

    it("text", {
        filename <- scriptexec::create_script_file("test123")
        extension <- get_os_string(".sh", ".bat")

        found <- grepl(extension, filename)
        expect_true(found)

        text <- readLines(filename)
        expect_equal(text, "test123")
    })
})
