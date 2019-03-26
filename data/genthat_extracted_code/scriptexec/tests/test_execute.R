context("execute")

describe("execute", {
    source("helper.R")

    it("valid exit code", {
        output <- scriptexec::execute("exit 0")
        expect_equal(output$status, 0)
    })

    it("valid command", {
        output <- scriptexec::execute("echo test")
        expect_equal(output$status, 0)
    })

    it("valid commands", {
        output <- scriptexec::execute(c("echo", "cd", "echo test"))
        expect_equal(output$status, 0)
    })

    it("cli arguments is NULL", {
        output <- scriptexec::execute("exit 0", args = NULL)
        expect_equal(output$status, 0)
    })

    it("cli arguments", {
        arg <- get_os_string("$ARG1", "%ARG1%")
        script <- paste("echo", arg, sep = " ")

        output <- scriptexec::execute(script, c("TEST_R"))
        expect_equal(output$status, 0)

        found <- grepl("TEST_R", output$output)
        expect_true(found)
    })

    it("env vars", {
        command <- get_os_string("echo $ENV_TEST", "echo %ENV_TEST%")

        output <- scriptexec::execute(command, env = c("ENV_TEST=MYENV"))
        expect_equal(output$status, 0)

        found <- grepl("MYENV", output$output)
        expect_true(found)
    })

    it("error exit code", {
        expect_warning(output <- scriptexec::execute("exit 1"))
        expect_equal(output$status, 1)
    })

    it("no wait", {
        output <- scriptexec::execute("echo test", wait = FALSE)
        expect_equal(output$status, -1)
    })

    it("error exit code with no wait", {
        output <- scriptexec::execute("exit 1", wait = FALSE)
        expect_equal(output$status, -1)
    })

    it("runner provided", {
        runner <- get_os_string("sh", "cmd.exe")
        output <- scriptexec::execute("echo test", runner = runner)
        expect_equal(output$status, 0)
    })

    it("print_commands", {
        output <- scriptexec::execute("echo test", print_commands = TRUE)
        expect_equal(output$status, 0)
    })

    it("error during invocation", {
        output <- scriptexec::execute("badcommand")
        expect_equal(output$status, 1)
    })

    describe("script", {
        it("default", {
            output <- scriptexec::execute("echo test")
            expect_true(is.null(output$script))
        })

        it("FALSE", {
            script <- "echo test"
            output <- scriptexec::execute(script, get_runtime_script = FALSE)
            expect_true(is.null(output$script))
        })

        it("TRUE", {
            script <- "echo test"
            output <- scriptexec::execute(script, get_runtime_script = TRUE)
            expect_false(is.null(output$script))
            found <- find_string("echo test", output$script)
            expect_true(found)
        })
    })
})
