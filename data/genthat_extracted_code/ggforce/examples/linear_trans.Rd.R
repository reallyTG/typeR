library(ggforce)


### Name: linear_trans
### Title: Create a custom linear transformation
### Aliases: linear_trans rotate stretch shear translate reflect

### ** Examples

trans <- linear_trans(rotate(a), shear(1, 0), translate(x1, y1))
square <- data.frame(x = c(0, 0, 1, 1), y = c(0, 1, 1, 0))
square2 <- trans$transform(square$x, square$y, a = pi / 3, x1 = 4, y1 = 8)
square3 <- trans$transform(square$x, square$y, a = pi / 1.5, x1 = 2, y1 = -6)
square <- rbind(square, square2, square3)
square$group <- rep(1:3, each = 4)
ggplot(square, aes(x, y, group = group)) +
  geom_polygon(aes(fill = factor(group)), colour = 'black')



