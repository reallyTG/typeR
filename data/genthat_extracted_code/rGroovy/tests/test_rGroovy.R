#
# IF Error: '\.' is an unrecognized escape in character string starting "'\."
#    AND the problem involves build -> test package
#
# THEN TRY THE FOLLOWING:
#
#     install.packages("devtools")
#
# TODO:
#   - install.packages("testthat")
#
# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
#
# WARNING:
#
# Using Test Package will result in a java.lang.ClassNotFoundException -- to run this test use Check Package.
#
# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
#
# PRECONDITION: The GROOVY_JARS option MUST BE SET prior to running these tests.
#
# We do not want these tests being run on CRAN because the Groovy dependencies must be included otherwise they will
# fail. We can test for this by uncommenting the following line and when devtools::check is executed, we should not see
# any failed tests.
#
# For example:
#
# > groovyJars <- list ("C:/development/software/groovy-2.4.13/indy/groovy-2.4.13-indy.jar")
# > options(GROOVY_JARS=groovyJars)
# > devtools::test()
#
# -----
#
# If the following error is encountered while testing:
#
# Error : package 'rJava' could not be loaded
# Error: loading failed
# Execution halted
# *** arch - x64
# ERROR: loading failed for 'i386'
#
# Then the solution is as follows:
#
# Reinstall R with ONLY the 64-bit libraries.
# 
# -----
#
# If you encounter a problem with rJava not being able to locate an .so file while on a Mac, one solution is
# to execute the following line prior to loading the rJava library:
#
# dyn.load('/Library/Java/JavaVirtualMachines/jdk[your version here].jdk/Contents/Home/jre/lib/server/libjvm.dylib')
#
# Also, if you encounter a problem such as "Library not loaded: @rpath/libjvm.dylib", execute the following:
# 
# $ cd /Library/Frameworks/R.framework/Versions/3.3/Resources/lib
# $ ln -s /Library/Java/JavaVirtualMachines/jdk1.8.0_73.jdk/Contents/Home/jre/lib/server/libjvm.dylib libjvm.dylib
#
# -----
#
# NOTE: This code should only be used when testing locally.
#
# Sys.setenv(NOT_CRAN='true')

context ("test rGroovy context")

test_that (
    "Calling Initialize twice does not raise an error.",
    {
        # This test also acts as a precondition for the following tests since it calls the
        # Initialize function.
        #
        # There's still some issue with these tests in that when they're executed via test()
        # they all pass, whereas when they're executing via check() we see two failures.
        
        skip_on_cran()

        options(GROOVY_JARS=list("Values not assigned."))

        rGroovy::Initialize ()
        expect_warning (rGroovy::Initialize ())
    }
)

test_that(
    "When jre version is less than 1.7, stop is called.",
    {
        skip_on_cran()

        expect_error(rGroovy:::CheckJRERuntimeVersion("1.6"), "Java 7.*")
    }
)

test_that(
    "When jre version is equal to 1.7, stop is NOT called.",
    {
        skip_on_cran()

        expect_error(rGroovy:::CheckJRERuntimeVersion("1.7"), NA)
    }
)

test_that(
    "When jre version is greater than 1.7, stop is NOT called.",
    {
        skip_on_cran()

        expect_error(rGroovy:::CheckJRERuntimeVersion("1.8"), NA)
        expect_error(rGroovy:::CheckJRERuntimeVersion("1.9"), NA)
        #
        # For Java 10 the following:
        #
        # runtime_version <- .jcall("java/lang/System", "S", "getProperty", "java.runtime.version")
        #
        # returns:
        #
        #   [1] "10+46"
        #
        expect_error(rGroovy:::CheckJRERuntimeVersion("10"), NA)
        expect_error(rGroovy:::CheckJRERuntimeVersion("10+46"), NA)
        expect_error(rGroovy:::CheckJRERuntimeVersion("11"), NA)
        expect_error(rGroovy:::CheckJRERuntimeVersion("11+46"), NA)
    }
)

test_that(
    "When jre version is equal to 2, 2.0, 2.1, stop is NOT called.",
    {
        skip_on_cran()

        expect_error(rGroovy:::CheckJRERuntimeVersion("2"), NA)
        expect_error(rGroovy:::CheckJRERuntimeVersion("2.0"), NA)
        expect_error(rGroovy:::CheckJRERuntimeVersion("2.1"), NA)
    }
)

test_that (
    "The Groovy script executes correctly.",
    {
        skip_on_cran()

        groovyScript <- "return 'Hello world!'"

        result <- rGroovy::Evaluate (groovyScript=groovyScript)

        expect_equal("Hello world!", result)
    }
)

test_that (
    "A NULL Groovy script raises an exception.",
    {
        skip_on_cran()

        expect_error(rGroovy::Evaluate (groovyScript=NULL), "The groovyScript parameter cannot be NULL.")
    }
)

test_that (
    "Execute with NULL variables does not raise an exception.",
    {
        skip_on_cran()

        groovyScript <- "return 'Hello world!'"

        result <- rGroovy::Execute (groovyScript=groovyScript, variables=NULL)

        expect_equal("Hello world!", result)
    }
)