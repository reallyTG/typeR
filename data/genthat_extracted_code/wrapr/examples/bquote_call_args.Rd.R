library(wrapr)


### Name: bquote_call_args
### Title: Treat ... argument as bquoted-values.
### Aliases: bquote_call_args

### ** Examples


f <- function(q, ...) {
  env = parent.frame()
  # match.call() best called in function context.
  captured_call <- match.call()
  captured_args <- bquote_call_args(captured_call, env)
  for(nmi in setdiff(ls(),
                     c("captured_call", "captured_args", "env"))) {
    print(paste(nmi, get(nmi)))
  }
  captured_args
}

z <- "x"
y <- 5
qv <- 3

# equivilent to f(3, x = 5)
args <- f(q = .(qv), .(z) := .(y))

print(args)




