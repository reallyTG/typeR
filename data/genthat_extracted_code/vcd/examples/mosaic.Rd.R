library(vcd)


### Name: mosaic
### Title: Extended Mosaic Plots
### Aliases: mosaic mosaic.default mosaic.formula
### Keywords: hplot

### ** Examples

library(MASS)
data("Titanic")
mosaic(Titanic)

## Formula interface for tabulated data plus shading and legend:
mosaic(~ Sex + Age + Survived, data = Titanic,
  main = "Survival on the Titanic", shade = TRUE, legend = TRUE)

data("HairEyeColor")
mosaic(HairEyeColor, shade = TRUE)
## Independence model of hair and eye color and sex.  Indicates that
## there are significantly more blue eyed blond females than expected
## in the case of independence (and too few brown eyed blond females).

mosaic(HairEyeColor, shade = TRUE, expected = list(c(1,2), 3))
## Model of joint independence of sex from hair and eye color.  Males
## are underrepresented among people with brown hair and eyes, and are
## overrepresented among people with brown hair and blue eyes, but not
## "significantly".

## Formula interface for raw data: visualize crosstabulation of numbers
## of gears and carburettors in Motor Trend car data.
data("mtcars")
mosaic(~ gear + carb, data = mtcars, shade = TRUE)

data("PreSex")
mosaic(PreSex, condvars = c(1,4))
mosaic(~ ExtramaritalSex + PremaritalSex | MaritalStatus + Gender,
       data = PreSex)

## Highlighting:
mosaic(Survived ~ ., data = Titanic)

data("Arthritis")
mosaic(Improved ~ Treatment | Sex, data = Arthritis, zero_size = 0)
mosaic(Improved ~ Treatment | Sex, data = Arthritis, zero_size = 0,
       highlighting_direction = "right")



