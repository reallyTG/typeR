# From SamplerCompare, (c) 2010 Madeleine Thompson

# This script makes sure the indep-mh-sampler.c example works as
# described in glue.Rnw.

library("SamplerCompare")

# Copy indep-mh-sampler.c to a temporary directory, then set the working
# directory there so we can compile it.

tmpd <- tempfile(pattern = "indep-mh-build")
dir.create(tmpd)
installed.file <- file.path(system.file("doc", package = "SamplerCompare"),
                            "indep-mh-sampler.c")
target.file <- file.path(tmpd, "indep-mh-sampler.c")
file.copy(installed.file, target.file)
setwd(tmpd)

# Set CPPFLAGS to add .../include to the search path so that
# SamplerCompare.h can be found.

include.dir <- system.file("include", package = "SamplerCompare")
Sys.setenv(MAKEFLAGS = sprintf("CPPFLAGS=-I%s", include.dir))

# "R CMD SHLIB" inside "R CMD check" breaks if you change the working
# directory, so unset R_TESTS.

Sys.unsetenv("R_TESTS")

# Build and link indep-mh-sampler.c.  Windows does not automatically
# include Rblas, unix does.

if (.Platform$OS.type == "windows") {
  rcmd <- file.path(R.home(), paste("bin", Sys.getenv("R_ARCH"), sep = ""),
                    "Rcmd SHLIB indep-mh-sampler.c -lRblas 2>&1")
} else {
  rcmd <- file.path(R.home(), "bin", "R CMD SHLIB indep-mh-sampler.c")
}

r <- system(rcmd)
stopifnot(r == 0)

lib.file <- paste("indep-mh-sampler", .Platform$dynlib.ext, sep = "")

running.arch <- paste(.Platform$file.sep, .Platform$r_arch, sep = "")
build.arch <- Sys.getenv("R_ARCH")

# If we are not cross-compiling, we can test the shared object.

if (running.arch != build.arch) {

  message("Cross-compiling; not testing built library.")

} else {

  # load the built library

  dyn.load(lib.file)

  # define an R sampler function

  indep.mh.sample <- wrap.c.sampler(sampler.symbol = "indep_mh",
                                    sampler.context = 0,
                                    name = "Independence MH")

  # run a simulation with the sampler

  set.seed(17)
  sim <- indep.mh.sample(N2weakcor.dist, c(20, -20), 500)

  # Make sure results are reasonable; this test fails rarely, but
  # setting the seed guarantees this unless there are code changes.

  stopifnot(all(abs(colMeans(sim$X)) < 0.2))
}

# Clean up.
unlink(tmpd, recursive = TRUE)
