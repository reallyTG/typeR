library(softclassval)


### Name: hardclasses
### Title: Convert to hard class labels
### Aliases: hardclasses harden

### ** Examples

softclassval:::pred
harden (softclassval:::pred)
harden (softclassval:::pred, closed = FALSE)

## classical threshold at 0.5
harden (softclassval:::pred, tol = 0.5)

## grey zone: NA for memberships between 0.25 and 0.75
harden (softclassval:::pred, tol = 0.25)

## threshold at 0.7 = 0.5 + 0.2:
harden (softclassval:::pred - 0.2, tol = 0.5)
harden (softclassval:::pred - 0.2, tol = 0.5, closed = FALSE)



