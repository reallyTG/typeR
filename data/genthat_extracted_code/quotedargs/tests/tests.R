# Package quotedargs - A way of writing functions that quote their arguments
#
# Copyright Radford M. Neal, 2017.  Distributed under GPL-2 or GPL-3.


# TESTS OF CORRECTNESS.

library(quotedargs)


# Create quoted 'arguments' with quoted_assign and see that their value,
# quoted_environment, and quoted_eval are correct.

e1 <- new.env()
e2 <- new.env()

quoted_assign ("Q", quote(xyz+1), eval.env=e1, assign.env=e2)

e1$xyz <- 1000
e1$abc <- c(TRUE,FALSE)

with (e2, {
    stopifnot (identical (Q, quote(xyz+1)))
    stopifnot (identical (quoted_environment(Q), e1))
    stopifnot (identical (quoted_eval(Q), 1001))
})

h <- function () {

    # Do in a function because 'substitute' is funny in global environment.

    x <- quote(fred)

    quoted_assign(x,22+33,NULL)

    stopifnot (identical (fred, 55))
    stopifnot (identical (quoted_environment(fred), NULL))
    stopifnot (identical (quoted_eval(fred), 55))
    stopifnot (identical (substitute(fred), quote(22+33)))
}

h()


# Have g quote some arguments, then pass them on to f, which may also
# quote them, and see that everything comes out right, including
# notquoted having the right effect.  Use e1 from above.

f <- function (x,y,z,n,m,o) {

    quoted_arg(x,z,n,m)

    stopifnot (identical (x, quote(1+2)))
    stopifnot (identical (y, 10))
    stopifnot (identical (z, quote(abc)))
    stopifnot (identical (n, quote(k)))
    stopifnot (identical (m, 64))
    stopifnot (identical (o, quote(def^2)))

    stopifnot (identical (quoted_environment(x), .GlobalEnv))
    stopifnot (identical (quoted_environment(z), genv))
    stopifnot (identical (quoted_environment(n), NULL))
    stopifnot (identical (quoted_environment(m), NULL))

    stopifnot (identical (quoted_eval(x), 3))
    stopifnot (identical (quoted_eval(z), quote(k)))
    stopifnot (identical (quoted_eval(n), quote(k)))
    stopifnot (identical (quoted_eval(m), 64))

    quoted_assign ("u", m)
    stopifnot (identical (u, 64))
    stopifnot (identical (quoted_environment(u), NULL))
    stopifnot (identical (quoted_eval(u), 64))

    quoted_assign ("v", z, e1)
    stopifnot (identical (v, quote(abc)))
    stopifnot (identical (quoted_environment(v), e1))
    stopifnot (identical (quoted_eval(v), c(TRUE,FALSE)))

    quoted_assign ("w", z)
    stopifnot (identical (w, quote(abc)))
    stopifnot (identical (quoted_environment(w), genv))
    stopifnot (identical (quoted_eval(w), quote(k)))

}

g <- function (p,q,r) { 
    quoted_arg(p,q,r)

    stopifnot (identical (p, quote(1+2)))
    stopifnot (identical (q, 64))
    stopifnot (identical (r, quote(def^2)))

    stopifnot (identical (quoted_environment(p), .GlobalEnv))
    stopifnot (identical (quoted_environment(q), NULL))
    stopifnot (identical (quoted_environment(r), .GlobalEnv))

    stopifnot (identical (quoted_eval(p), 3))
    stopifnot (identical (quoted_eval(q), 64))
    stopifnot (identical (quoted_eval(r), 64))

    genv <<- environment()
    abc <- quote(k)
    f(p,4+6,abc,notquoted(abc),q,r)
}

def <- 8
g(1+2,notquoted(def^2),def^2)


# Check that 'missing' works OK on quoted arguments.

F <- function (a,b,c,d) {
    quoted_arg(a,b,c,d)
    stopifnot (identical (missing(a), TRUE))
    stopifnot (identical (missing(b), FALSE))
    stopifnot (identical (missing(c), TRUE))
    stopifnot (identical (missing(d), FALSE))
}

G <- function (a,b) {
    F(a,b,,qqq)
}

G(,rrr)


# Check that searching for already quoted argument can go to enclosing
# function.

H <- function (x) {
    quoted_arg(x)
    f <- function () {
        stopifnot (identical (quoted_environment(x), e))
        stopifnot (identical (quoted_eval(x), "Hi Fred"))
        quoted_assign("z",x,assign.env=parent.env(environment()))
    }
    f()
    stopifnot (identical (quoted_eval(z), "Hi Fred"))
}

local ({ k <- "Fred"; e <<- environment(); H(paste("Hi",k)) })

