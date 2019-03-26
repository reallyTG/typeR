context("generate_env_setup_script")

describe("generate_env_setup_script", {
    source("helper.R")

    it("no env", {
        script <- scriptexec::generate_env_setup_script()

        length <- length(script)
        expect_equal(length, 0)
    })

    it("multiple env vars", {
        script <- scriptexec::generate_env_setup_script(c("e1=v1", "e2=v2"))

        length <- length(script)
        expect_equal(length, 2)

        prefix <- get_os_string("export", "SET")
        expected_result <- c(paste(prefix, "e1=v1", sep = " "), paste(prefix,
            "e2=v2", sep = " "))

        expect_equal(expected_result, script)
    })
})
