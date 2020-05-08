# TODO: this should be generated from the env file
R_PROJECT_BASE_DIR <- "/var/lib/R"
R_VERSION <- "3.5"
R_VERSION_FULL <- "3.5.0"

LIB_DIR <- path(R_PROJECT_BASE_DIR, "library", R_VERSION)
RUN_DIR <- path(R_PROJECT_BASE_DIR, "run")

CRAN_MIRROR_DIR <- path(R_PROJECT_BASE_DIR, "CRAN")
CRAN_LOCAL_MIRROR <- paste0("file://", CRAN_MIRROR_DIR)

PACKAGES_SRC_DIR <- path(CRAN_MIRROR_DIR, "extracted")

TYPER_BASE_DIR <- path(R_PROJECT_BASE_DIR, "typeR", "evaluation")
PAPER_BASE_DIR <- path(R_PROJECT_BASE_DIR, "typeR", "paper")
PLOT_DIR <- path(PAPER_BASE_DIR, "plots")
TAGS_DIR <- PAPER_BASE_DIR

## all packages
ALL_PACKAGES_DETAILS <- path(TYPER_BASE_DIR, "all-packages.csv")

## corpus related
CORPUS_FILE    <- path(TYPER_BASE_DIR, "corpus.txt")
CORPUS_DETAILS <- path(TYPER_BASE_DIR, "corpus-details.csv")
CORPUS_PLOT    <- path(PLOT_DIR, "corpus.pdf")
CORPUS_REVDEPS <- path(TYPER_BASE_DIR, "corpus-revdeps.txt")

# package coverage related
PACKAGE_COVERAGE_DIR <- path(RUN_DIR, "package-coverage")
PACKAGE_COVERAGE_RUN <- path(PACKAGE_COVERAGE_DIR, "parallel-results.csv")
PACKAGE_COVERAGE_LOG <- path(PACKAGE_COVERAGE_DIR, "parallel.log")
PACKAGE_COVERAGE     <- path(PACKAGE_COVERAGE_DIR, "coverage.csv")

# package metadata related
PACKAGE_METADATA_DIR <- path(RUN_DIR, "package-metadata")
PACKAGE_METADATA     <- path(PACKAGE_METADATA_DIR, "metadata.csv")
PACKAGE_SLOC         <- path(PACKAGE_METADATA_DIR, "sloc.csv")

# package load related
PACKAGE_LOAD_DIR <- path(RUN_DIR, "package-load")
PACKAGE_LOAD_RUN <- path(PACKAGE_LOAD_DIR, "parallel-results.csv")

# package functions
PACKAGE_FUNCTIONS_DIR <- path(RUN_DIR, "package-functions")
PACKAGE_FUNCTIONS     <- path(PACKAGE_FUNCTIONS_DIR, "functions.csv")

# package runnable code
PACKAGE_RUNNABLE_CODE_DIR      <- path(RUN_DIR, "extract-package-runnable-code")
PACKAGE_RUNNABLE_CODE_RUN      <- path(PACKAGE_RUNNABLE_CODE_DIR, "parallel-results.csv")
PACKAGE_RUNNABLE_CODE_METADATA <- path(PACKAGE_RUNNABLE_CODE_DIR, "runnable-code-metadata.csv")

# package runs
PACKAGE_RUN_DIR <- path(RUN_DIR, "run-extracted-code")
PACKAGE_RUN     <- path(PACKAGE_RUN_DIR, "run.csv")

# runtime checks related
PACKAGE_ASSERTS_DIR <- path(RUN_DIR, "package-asserts")
PACKAGE_ASSERTS_RUN <- path(PACKAGE_ASSERTS_DIR, "parallel-results.csv")
PACKAGE_ASSERTS_LOG <- path(PACKAGE_ASSERTS_DIR, "parallel.log")
PACKAGE_ASSERTS     <- path(PACKAGE_ASSERTS_DIR, "package-asserts.csv")
