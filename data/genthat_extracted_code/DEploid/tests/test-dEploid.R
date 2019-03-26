context("dEploid")

vcfFileName <- system.file("extdata", "PG0390-C.test.vcf.gz",
    package = "DEploid")
plafFileName <- system.file("extdata", "labStrains.test.PLAF.txt",
    package = "DEploid")
panel_file <- system.file("extdata", "labStrains.test.panel.txt",
    package = "DEploid")


test_that("printing help & verison information works", {
    for (version in list(dEploid("-v"), dEploid("-version"))) {
        expect_that(version, is_a("list"))
        expect_that(version$version, is_a("character"))
    }

    expect_error(dEploid("-h"))
    expect_error(dEploid("--help"))
})


test_that("parsing arguments works", {
    expect_error(dEploid("--version"))
    expect_error(dEploid(paste("-vcf", vcfFileName, "-plaf", plafFileName)))
    expect_error(dEploid(paste("-vcf", vcfFileName, "-plaf", plafFileName,
        "-panel", panel_file, "-noPanel")))
})


test_that("runs a reproducible", {
    set.seed(119)
    res1 <- dEploid(paste("-vcf", vcfFileName, "-plaf", plafFileName,
        "-noPanel"))
    set.seed(119)
    res2 <- dEploid(paste("-vcf", vcfFileName, "-plaf", plafFileName,
        "-noPanel"))
    expect_equal(res1, res2)

    set.seed(119)
    res3 <- dEploid(paste("-vcf", vcfFileName, "-plaf", plafFileName, "-panel",
        panel_file))
    set.seed(119)
    res4 <- dEploid(paste("-vcf", vcfFileName, "-plaf", plafFileName, "-panel",
        panel_file))
    expect_equal(res3, res4)
})


test_that("warning is given when using -seed", {
    expect_warning(dEploid(paste("-vcf", vcfFileName, "-plaf", plafFileName,
        "-noPanel -seed 1")))
})
