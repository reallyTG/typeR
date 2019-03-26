library(testthat);
suppressMessages(require(valection));

context("run directed sampling");

if (valection::check.for.library()) {
	out.dir  <- tempdir();
	out.file <- paste0(out.dir, "/outfile_example.txt");

	valection::run.directed.sampling(
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

	expectedResult <- read.table("expected.run.directed.sampling.txt");

	test_that("Directed sampling works", {
		expect_equal(samplingResult, expectedResult);
		});
	}