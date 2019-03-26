library(quotedargs)


### Name: quotedargs-package
### Title: Facility for using quoted arguments
### Aliases: quotedargs-package quoted_arg notquoted quoted_eval
###   quoted_environment quoted_assign

### ** Examples

# A simple example in which both the expression passed and its value
# are used.

showmean <- function (v) {
    quoted_arg(v)
    cat ("Mean of", deparse(v), "is", mean(quoted_eval(v)), "\n")
}

showmean(100+(1:3))                   # Will print 100 + (1:3)
showmean(notquoted(100+(1:3)))        # Will print c(101, 102, 103)

# A function that uses the function above, passing along its quoted 
# argument.

showmeansummary <- function (u) {
    quoted_arg(u)
    cat("Summary: ")
    showmean(u)
}

showmeansummary(100+(1:3))            # Will print 100 + (1:3), not u!
showmeansummary(notquoted(100+(1:3))) # Will print c(101, 102, 103)

u <- v <- 100+(1:3)   # Evaluation of showmeansummary's argument
showmeansummary(u)    #   is done in the environment of the caller,
showmeansummary(v)    #   not that of showmeansummary or showmean


# An illustration of quoted arguments being evaluated many times.

prsim <- function (a,b,n) {
    quoted_arg(a,b)
    cat ("Running simulation to find probability that all\n")
    cat (deparse(a), "are greater than all", deparse(b), "\n")
    count <- 0
    for (i in 1:n) {
        if (min(quoted_eval(a)) > max(quoted_eval(b)))
            count <- count + 1
    }
    count / n
}

set.seed(1)
prsim (rexp(10,0.1), rnorm(10,1), 1000)


# Creating a variable that behaves like a quoted argument.

quoted_assign("x",quote(runif(1)))

set.seed(1)
cat (paste0("Two evaluations of ",deparse(x),": "),
     quoted_eval(x), quoted_eval(x),
     "\n")


# Examples of when quotation of an argument is passed on.

qfun1 <- function (x) { quoted_arg(x); list(x,quoted_eval(x)) }

qfun2 <- function (y) {
    quoted_arg(y)
    a <- y
    quoted_assign ("b", y)
    list(qfun1(y),qfun1((y)),qfun1(a),qfun1(b))
}

qfun2(1+2)


# Example of how quoted_arg and quoted_eval can be used to avoid
# copying of a large object.

sum_first_last1 <- function (v) {
    v[1] + v[length(v)]
}

sum_first_last2 <- function (v) {
    quoted_arg(v)
    quoted_eval(v)[1] + quoted_eval(v)[length(quoted_eval(v))]
}

f <- function (sumfl) {
    x <- 1:100000
    r <- sumfl(x)
    x[2] <- 0L
    r
}

f(sum_first_last1)  # x[2] <- 0L first copies x (in current R implementations)
f(sum_first_last2)  # x[2] <- 0L does not result in x being copied


# Example of using quotedargs to build functions that take as
# arguments expressions that may reference columns of a data
# frame and variables accessible in the caller's environment.
# The data frame columns take precedence, except that the data
# frame is skipped for expressions enclosed in O(...).

dfeval <- function (df, expr) {    # Find value of expression
    quoted_arg(expr)
    env <- new.env (parent = quoted_environment(expr), hash=FALSE)
    env$O <- function (z) { quoted_arg(z); eval(z,parent.env(environment())) }
    environment(env$O) <- env
    eval (expr, df, env)
}

dfchange <- function (df, expr) {  # Return data frame changed by assignments
    quoted_arg(expr)
    env <- new.env (parent = quoted_environment(expr), hash=FALSE)
    env$O <- function (z) { quoted_arg(z); eval(z,parent.env(environment())) }
    environment(env$O) <- env
    dfenv <- as.environment(df)
    parent.env(dfenv) <- env
    eval (expr, dfenv)
    as.data.frame (as.list (dfenv))
}

dfchange_var <- function (df, expr) {  # Actually change df variable passed
    quoted_arg(df,expr)
    newdf <- dfchange (quoted_eval(df), expr)
    assign (as.character(df), newdf, quoted_environment(df))
}

tstdf <- as.data.frame (list (x = 1:4, y = c("a","b","c","d")))

y <- 100
dfeval (tstdf, paste0(y,x))
dfeval (tstdf, x * O(y))

dfchange (tstdf, { z <- 10*x; x <- x + O(y) })

dfchange_var (tstdf, x <- 1000+x)
tstdf



