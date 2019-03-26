library(rPref)


### Name: base_pref_macros
### Title: Useful Base Preference Macros
### Aliases: around base_pref_macros between layered pos

### ** Examples

# search for cars where mpg is near to 25
psel(mtcars, around(mpg, 25))

# cyl = 2 and cyl = 4 are equally good, cyl = 6 is worse
psel(mtcars, layered(cyl, c(2, 4), 6))



