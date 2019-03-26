library(PRISMAstatement)


### Name: prisma
### Title: Generate a PRISMA statement flow chart
### Aliases: prisma

### ** Examples

prisma(1000, 20, 270, 270, 10, 260, 20, 240, 107)
prisma(1000, 20, 270, 270, 10, 260, 20, 240, 107,
       labels = list(found = "FOUND"))
prisma(1000, 20, 270, 270, 10, 260, 20, 240, 107, dpi = 24)
prisma(1000, 20, 270, 270, 10, 260, 20, 240, 107, extra_dupes_box = TRUE)
# giving impossible numbers should cause an error
tryCatch(
  prisma(1, 2, 3, 4, 5, 6, 7, 8, 9),
  error = function(e) e$message)
# giving unlikely numbers should cause a warning
tryCatch(
  prisma(1000, 20, 270, 270, 10, 260, 19, 240, 107),
  warning = function(w) w$message)
tryCatch(
  prisma(1000, 20, 270, 270, 269, 260, 20, 240, 107),
  warning = function(w) w$message)



