library(testthat);
suppressMessages(require(valection));

context("run equal per caller");

if (valection::check.for.library()) {
	out.dir  <- tempdir();
	out.file <- paste0(out.dir, "/outfile_example.txt");

	valection::run.equal.per.caller(
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

	expectedResult <- read.table("expected.run.equal.per.caller.txt");

	test_that("Equal per caller sampling works", {
		expect_equal(samplingResult, expectedResult);
		});
	}