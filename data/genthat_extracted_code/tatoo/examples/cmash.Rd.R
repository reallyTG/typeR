library(tatoo)


### Name: rmash
### Title: Mash R objects by Rows or Columns
### Aliases: rmash cmash

### ** Examples


dat1 <- data.frame(
  x = 1:3,
  y = 4:6
)

dat2 <- data.frame(
  x = letters[1:3],
  y = letters[4:6]
)

rmash(dat1, dat2)

#    x y
# 1: 1 4
# 2: a d
# 3: 2 5
# 4: b e
# 5: 3 6
# 6: c f

cmash(dat1, dat2)

#    x x y y
# 1: 1 a 4 d
# 2: 2 b 5 e
# 3: 3 c 6 f





