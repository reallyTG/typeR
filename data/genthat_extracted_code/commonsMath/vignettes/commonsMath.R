## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)

## ------------------------------------------------------------------------
library("rscala")
s <- scala("commonsMath")
rng1 <- s$.new_org.apache.commons.math3.random.RandomDataGenerator()
rng1$reSeed(7342L)
rng1$nextGaussian(0,1)

## ------------------------------------------------------------------------
library("rJava")
.jinit(Sys.glob(file.path(system.file(package="commonsMath"), "java", "*.jar")))
rng2 <- .jnew("org.apache.commons.math3.random.RandomDataGenerator")
rng2$reSeed(.jlong(7342L))
rng2$nextGaussian(0,1)

## ------------------------------------------------------------------------
.onLoad <- function(libname, pkgname) {
  s <- scala("commonsMath")
  assign("s", s, envir = parent.env(environment()))
}

## ------------------------------------------------------------------------
rstdnorm <- function() {
  rng1 <- s$.new_org.apache.commons.math3.random.RandomDataGenerator()
  rng1$nextGaussian(0.0,1.0)
}

## ------------------------------------------------------------------------
.onLoad <- function(libname, pkgname) {
  .jpackage(pkgname, lib.loc=libname)
}

## ------------------------------------------------------------------------
rstdnorm <- function() {
  rng2 <- .jnew("org.apache.commons.math3.random.RandomDataGenerator")
  rng2$nextGaussian(0,1)
}

