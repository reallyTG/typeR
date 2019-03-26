library(vcd)


### Name: ternaryplot
### Title: Ternary Diagram
### Aliases: ternaryplot
### Keywords: hplot

### ** Examples

data("Arthritis")

## Build table by crossing Treatment and Sex
tab <- as.table(xtabs(~ I(Sex:Treatment) + Improved, data = Arthritis))

## Mark groups
col <- c("red", "red", "blue", "blue")
pch <- c(1, 19, 1, 19)

## plot
ternaryplot(
            tab,
            col = col,
            pch = pch,
            prop_size = TRUE,
            bg = "lightgray",
            grid_color = "white",
            labels_color = "white",
            main = "Arthritis Treatment Data"
           )
## legend
grid_legend(0.8, 0.7, pch, col, rownames(tab), title = "GROUP")

## Titanic
data("Lifeboats")
attach(Lifeboats)
ternaryplot(
  Lifeboats[,4:6],
  pch = ifelse(side == "Port", 1, 19),
  col = ifelse(side == "Port", "red", "blue"),
  id  = ifelse(men / total > 0.1, as.character(boat), NA),
  prop_size = 2,
  dimnames_position = "edge",
  main = "Lifeboats on Titanic"
)
grid_legend(0.8, 0.9, c(1, 19),
  c("red", "blue"), c("Port", "Starboard"),
  title = "SIDE")


## Hitters
data("Hitters")
attach(Hitters)
colors <- c("black","red","green","blue","red","black","blue")
pch <- substr(levels(Positions), 1, 1)
ternaryplot(
  Hitters[,2:4],
  pch = as.character(Positions),
  col = colors[as.numeric(Positions)],
  main = "Baseball Hitters Data"
)
grid_legend(0.8, 0.9, pch, colors, levels(Positions),
  title = "POSITION(S)")




