context("Demos")

describe("Demos", {
    it("all demos", {
        directory <- "../../demo"
        files <- list.files(path = directory, pattern = ".R")
        for (file in files) {
            r_file <- file.path(directory, file)
            code <- readLines(r_file)

            local(code)
            expect(TRUE)
        }
    })
})
