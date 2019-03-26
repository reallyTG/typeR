context("Test that the environment works")

test_that("parent environment is correct",{
    skip_on_os("solaris")
    f <- dparse("tran.g");

    env <- new.env();
    env$test <- "found";

          f("
    b       = -1
    d/dt(X) = a*X + Y*Z;
    d/dt(Y) = b*(Y - Z);
    d/dt(Z) = -X*Y + c*Y - Z
    if (t < 0.02 | t > 99.98){
        print
    }
", function(name, value, pos, depth){
    expect_true(any(ls(envir=parent.frame(1)) == "test"));
    ## cat(sprintf("name:%s;value:%s;pos:%s;depth:%s\n", name, value, pos, depth));
}, envir=env)})


