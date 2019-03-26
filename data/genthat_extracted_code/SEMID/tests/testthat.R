library(testthat)
library(SEMID)

test_check("SEMID")


# testthat checks works within the namespace of the package
# so that you can test functions that are not exported. This
# is great but if you want to test to make sure that you
# set up the namespace correctly this is very annoying. The
# following runs the tests not in the namespace of the package.
# for (file in list.files(".")) {
# source(file)
# }