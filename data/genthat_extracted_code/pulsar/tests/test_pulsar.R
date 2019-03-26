context("setup pulsar test")

suppressPackageStartupMessages(library(batchtools))
options(batchtools.verbose=FALSE)
options(batchtools.progress=FALSE)
source('pulsarfuns.R')

rseed <- 10010
p     <- 30
set.seed(rseed)
dat <- huge::huge.generator(p*100, p, "hub", verbose=FALSE, v=.4, u=.2)
set.seed(rseed)
dat$data <- MASS::mvrnorm(p*100, mu=rep(0,p), Sigma=dat$sigma, empirical=TRUE)

tmpdir <- fs::path_real(tempdir())
conffile <- ""
pargs <- list(verbose=FALSE, scr=TRUE)

cstr <- "pulsar: %s; mode: %s"
######################################################
context(sprintf(cstr, 'huge', 'serial'))
huge.serial       <- runtests(pulsar, "pulsar", dat, fun=huge::huge,
                        fargs=pargs, seed=rseed, refit=FALSE)
huge.serial.refit <- runtests(pulsar, "pulsar", dat, fun=huge::huge,
                        fargs=pargs, seed=rseed, refit=TRUE)

######################################################
context(sprintf(cstr, 'quic', 'serial'))
quic.serial       <- runtests(pulsar, "pulsar", dat, fun=quicr,
                              fargs=list(), seed=rseed, refit=FALSE)
quic.serial.refit <- runtests(pulsar, "pulsar", dat, fun=quicr,
                              fargs=list(), seed=rseed, refit=TRUE)

######################################################
context(sprintf(cstr, 'huge', 'batch'))
huge.batch       <- runtests(batch.pulsar, "batch.pulsar", dat, fun=huge::huge,
                       fargs=pargs, conffile=conffile, cleanup=TRUE,
                       seed=rseed, wkdir=tmpdir, refit=FALSE)
huge.batch.refit <- runtests(batch.pulsar, "batch.pulsar", dat, fun=huge::huge,
                       fargs=pargs, conffile=conffile, cleanup=TRUE,
                       seed=rseed, wkdir=tmpdir, refit=TRUE)

######################################################
context(sprintf(cstr, 'quic', 'batch', ''))
quic.batch       <- runtests(batch.pulsar, "batch.pulsar", dat, fun=quicr,
                             fargs=list(), conffile=conffile, cleanup=TRUE,
                             seed=rseed, wkdir=tmpdir, refit=FALSE)
quic.batch.refit <- runtests(batch.pulsar, "batch.pulsar", dat, fun=quicr,
                             fargs=list(), conffile=conffile, cleanup=TRUE,
                             seed=rseed, wkdir=tmpdir, refit=TRUE)

######################################################
context("pulsar: serial vs batch")
msg  <- "huge: serial and batch mode are equivilent: no bounds"
msg2 <- "huge: serial and batch mode are equivilent: lower bound"
runcomptest(msg,  huge.serial$out,   huge.batch$out)
runcomptest(msg2, huge.serial$outb, huge.batch$outb)

msg  <- "quic: serial and batch mode are equivilent: no bounds"
msg2 <- "quic: serial and batch mode are equivilent: lower bound"
runcomptest(msg,  quic.serial$out,   quic.batch$out)
runcomptest(msg2, quic.serial$outb, quic.batch$outb)

#######################################################
context("pulsar: refit mode")
msg  <- "huge: serial refit test: no bounds"
msg2 <- "huge: serial refit test: lower bound"
runcomptest(msg, huge.serial$out,  huge.serial.refit$out)
runcomptest(msg, huge.serial$outb, huge.serial.refit$outb)

msg  <- "huge: batch refit test: no bounds"
msg2 <- "huge: batch refit test: lower bound"
runcomptest(msg, huge.batch$out,  huge.batch.refit$out)
runcomptest(msg, huge.batch$outb, huge.batch.refit$outb)

msg  <- "quic: serial refit test: no bounds"
msg2 <- "quic: serial refit test: lower bound"
runcomptest(msg, quic.serial$out,  quic.serial.refit$out)
runcomptest(msg, quic.serial$outb, quic.serial.refit$outb)

msg  <- "quic: batch refit test: no bounds"
msg2 <- "quic: batch refit test: lower bound"
runcomptest(msg, quic.batch$out,  quic.batch.refit$out)
runcomptest(msg, quic.batch$outb, quic.batch.refit$outb)


#######################################################
context("refit estimation function")
testrefit("refitting pulsar gives correct warnings & output", huge.serial$outb)
testrefit("refitting batch pulsar gives correct warnings & output", huge.batch$outb)

testrefit("prefitting pulsar gives correct warnings & output", huge.serial.refit$outb)
testrefit("prefitting batch pulsar gives correct warnings & output", huge.batch.refit$outb)

testrefit("refitting pulsar gives correct warnings & output", quic.serial$outb)
testrefit("refitting batch pulsar gives correct warnings & output", quic.batch$outb)

testrefit("prefitting pulsar gives correct warnings & output", quic.serial.refit$outb)
testrefit("prefitting batch pulsar gives correct warnings & output", quic.batch.refit$outb)
