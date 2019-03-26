context("modify_script")

describe("modify_script", {
    source("helper.R")

    it("no args", {
        script <- scriptexec::modify_script("")
        script <- paste(script, collapse = "\n")

        found <- grepl("ARG", script)
        expect_false(found)
    })

    it("multiple args", {
        script <- scriptexec::modify_script("", c("test1", "test2"))
        script <- paste(script, collapse = "\n")

        found <- grepl("ARG1", script)
        expect_true(found, TRUE)

        found <- grepl("ARG2", script)
        expect_true(found)

        found <- grepl("ARG3", script)
        expect_false(found)
    })

    it("print_commands", {
        script <- scriptexec::modify_script("", print_commands = TRUE)
        script <- paste(script, collapse = "\n")

        command <- get_os_string("set -x", "")
        found <- grepl(command, script)
        expect_true(found, TRUE)
    })
})
