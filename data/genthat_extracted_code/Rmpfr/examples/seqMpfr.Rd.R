library(Rmpfr)


### Name: seqMpfr
### Title: "mpfr" Sequence Generation
### Aliases: seqMpfr
### Keywords: manip

### ** Examples

seqMpfr(0, 1, by = mpfr(0.25, prec=88))

seqMpfr(7, 3) # -> default prec.
## Don't show: 
eq.test <- function(...) {
  args <- list(...)
  r <- do.call(seqMpfr, args)
  is(r, "mpfr") && all(r == do.call(seq, lapply(args, as.numeric)))
}
m <- mpfr(8, 60); m2 <- as(2, "mpfr")
stopifnot(seqMpfr(7,3) == 7:3, seqMpfr(to=1) == 1,
          eq.test(pi),
          eq.test(1,12,3),
          eq.test(1, by= 2, length= 5),
          eq.test(1, by=m2, length= 5),
          eq.test(1, length.out = 8),
          eq.test(1, length.out = m),
          eq.test(1, 8, length.out=8),
          eq.test(1, 8, length.out=m),
          eq.test(1, m, length.out=m),
          eq.test(1, m, length.out=8),
          eq.test(to=17, by= 2, length=4),
          eq.test(to=17, by=m2, length=4),
          TRUE)
## End(Don't show)



