library(testthat);
suppressMessages(require(valection));

context("run increasing with overlap");

if (valection::check.for.library()) {
	out.dir  <- tempdir();
	out.file <- paste0(out.dir, "/outfile_example.txt");

	valection::run.increasing.with.overlap(
		budget = 5,
		infile = system.file(
			"extdata/infile_example.tsv",
			package = "valection"
			),
		outfile = out.file,
		seed = 123
		);

	samplingResult <- read.table(out.file);
	file.remove(out.file);

	expectedResult <- read.table("expected.run.increasing.with.overlap.txt");

	test_that("Increasing with overlap sampling works", {
		expect_equal(samplingResult, expectedResult);
		});
	}