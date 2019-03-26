library(testthat);
suppressMessages(require(valection));

context("run random sampling");

if (valection::check.for.library()) {
	out.dir  <- tempdir();
	out.file <- paste0(out.dir, "/outfile_example.txt");

	valection::run.random.sampling(
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

	expectedResult <- read.table("expected.run.random.sampling.txt");

	test_that("Random sampling works", {
		expect_equal(samplingResult, expectedResult);
		});
	}