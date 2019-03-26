context("Examples")

describe("Examples", {
    it("all examples", {
        # execute script text
        output <- scriptexec::execute("echo command1\necho command2")
        expect_equal(output$status, 0)
        expect_equal(grepl("command1", output$output), TRUE)
        expect_equal(grepl("command2", output$output), TRUE)

        if (.Platform$OS.type == "windows") {
            ls_command <- "dir"
        } else {
            ls_command <- "ls"
        }
        output <- scriptexec::execute(c("echo user home:", ls_command))
        expect_equal(output$status, 0)

        # execute multiple commands as a script
        output <- scriptexec::execute(c("cd", "echo test"))
        expect_equal(output$status, 0)

        # pass arguments (later defined as ARG1, ARG2, ...) and env vars
        if (.Platform$OS.type == "windows") {
            command <- "echo %ARG1% %ARG2% %MYENV%"
        } else {
            command <- "echo $ARG1 $ARG2 $MYENV"
        }
        output <- scriptexec::execute(command, args = c("TEST1", "TEST2"),
            env = c("MYENV=TEST3"))
        expect_equal(output$status, 0)
        expect_equal(grepl("TEST1 TEST2 TEST3", output$output), TRUE)

        # non zero status code is returned in case of errors
        expect_warning(output <- scriptexec::execute("exit 1"))
        expect_equal(output$status, 1)

        # do not wait for command to finish
        output <- scriptexec::execute("echo my really long task", wait = FALSE)
        expect_equal(output$status, -1)
    })
})
