library(broom)


### Name: tidy.muhaz
### Title: Tidy a(n) muhaz object
### Aliases: tidy.muhaz muhaz_tidiers

### ** Examples

if (require("muhaz", quietly = TRUE)) {
  data(ovarian, package="survival")
  x <- muhaz::muhaz(ovarian$futime, ovarian$fustat)
  tidy(x)
  glance(x)
}




