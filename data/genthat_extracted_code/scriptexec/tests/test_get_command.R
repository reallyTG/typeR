context("get_command")

describe("get_command", {
    source("helper.R")

    it("filename provided", {
        command_struct <- scriptexec::get_command("myfile.sh")

        runner <- get_os_string("sh", "cmd.exe")
        expect_equal(runner, command_struct$command)
    })

    it("runner provided", {
        command_struct <- scriptexec::get_command("myfile.sh", "bash")

        expect_equal("bash", command_struct$command)
    })
})
