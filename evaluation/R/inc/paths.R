# TODO: this should be generated from the env file
R_PROJECT_BASE_DIR <- "/var/lib/R"
R_VERSION <- "3.5"
R_VERSION_FULL <- "3.5.0"

LIB_DIR <- path(R_PROJECT_BASE_DIR, "library", R_VERSION)
RUN_DIR <- path(R_PROJECT_BASE_DIR, "run")

CRAN_MIRROR_DIR <- path(R_PROJECT_BASE_DIR, "CRAN")
CRAN_LOCAL_MIRROR <- paste0("file://", CRAN_MIRROR_DIR)

PACKAGES_SRC_DIR <- path(CRAN_MIRROR_DIR, "extracted")

TYPER_BASE_DIR <- Sys.getenv("TYPER_BASE_DIR", path(R_PROJECT_BASE_DIR, "typeR"))

EVALUATION_DIR <- path(TYPER_BASE_DIR, "evaluation")
PAPER_DIR <- path(TYPER_BASE_DIR, "paper")
PLOT_DIR <- path(PAPER_DIR, "plots")
TAGS_DIR <- PAPER_DIR

## all packages
CRAN_PACKAGES_FILE      <- path(EVALUATION_DIR, "cran.txt")
CRAN_PACKAGES_DETAILS   <- path(EVALUATION_DIR, "cran-details.csv")
CRAN_REVDEPS            <- path(EVALUATION_DIR, "cran-revdeps.csv")
CRAN_COVERAGE_FUNCTIONS <- path(EVALUATION_DIR, "cran-coverage-functions.csv")
CRAN_ASSERTS            <- path(EVALUATION_DIR, "cran-asserts.csv")

## corpus related
CORPUS_FILE                  <- path(EVALUATION_DIR, "corpus.txt")
CORPUS_DETAILS               <- path(EVALUATION_DIR, "corpus-details.csv")
CORPUS_REVDEPS               <- path(EVALUATION_DIR, "corpus-revdeps.csv")
CORPUS_REVDEPS_UNIQUE        <- path(EVALUATION_DIR, "corpus-revdeps.txt")
COVERAGE_REVDEP_FUNCTIONS    <- path(EVALUATION_DIR, "corpus-coverage-functions.csv")

## plots
CORPUS_PLOT           <- path(PLOT_DIR, "corpus.pdf")

# package coverage related
PACKAGE_COVERAGE_DIR     <- path(RUN_DIR, "package-coverage")
PACKAGE_COVERAGE_RUN     <- path(PACKAGE_COVERAGE_DIR, "parallel-results.csv")
PACKAGE_COVERAGE_LOG     <- path(PACKAGE_COVERAGE_DIR, "parallel.log")
PACKAGE_COVERAGE         <- path(PACKAGE_COVERAGE_DIR, "coverage.csv")
PACKAGE_COVERAGE_DETAILS <- path(PACKAGE_COVERAGE_DIR, "coverage-details.csv")

# package revdeps coverage
PACKAGE_REVDEPS_COVERAGE_DIR     <- path(RUN_DIR, "package-revdep-coverage")
PACKAGE_REVDEPS_COVERAGE         <- path(PACKAGE_REVDEPS_COVERAGE_DIR, "revdep-coverage.csv")
PACKAGE_REVDEPS_COVERAGE_DETAILS <- path(PACKAGE_REVDEPS_COVERAGE_DIR, "revdep-coverage-details-expr.csv")
PACKAGE_REVDEPS_RUNS             <- path(PACKAGE_REVDEPS_COVERAGE_DIR, "revdep-runs.csv")

# package roxygen
PACKAGE_USES_ROXYGEN <- path(RUN_DIR, "package-uses-roxygen", "roxygen.csv")

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
PACKAGE_CLASSES       <- path(PACKAGE_FUNCTIONS_DIR, "classes.csv")

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
