library(vcd)


### Name: grid_legend
### Title: Legend Function for grid Graphics
### Aliases: grid_legend
### Keywords: hplot

### ** Examples

data("Lifeboats")
attach(Lifeboats)
ternaryplot(Lifeboats[,4:6],
  pch = ifelse(side == "Port", 1, 19),
  col = ifelse(side == "Port", "red", "blue"),
  id  = ifelse(men / total > 0.1, as.character(boat), NA),
  prop_size = 2,
  dimnames_position = "edge",
  main = "Lifeboats on Titanic")
grid_legend(0.8, 0.9, c(1, 19), c("red", "blue"),
  c("Port", "Starboard"), title = "SIDE")


grid.newpage()
pushViewport(viewport(height = .9, width = .9 ))
grid.rect(gp = gpar(lwd = 2, lty = 2))

grid_legend(x = unit(.05,'npc'),
            y = unit(.05,'npc'),
            just = c(0,0),
            pch = c(1,2,3),
            col = c(1,2,3),
            lwd=NA, 
            lty=NA,
            labels = c("b",'r','g'),
            title = NULL,
            gp=gpar(lwd=2, cex=1),
            hgap = unit(.8, "lines"),
            vgap = unit(.9, "lines"))

grid_legend(x = unit(1,'npc'),
            y = unit(1,'npc'),
            just = c(1,1),
            pch = NA,
            col = c(1,2,3,4),
            lwd=c(1,1,1,3), 
            lty=c(1,2,1,3),
            labels = c("black",'red','green','blue'),
            gp_labels = list(gpar(col = 1), gpar(col = 2), gpar(col = 3), gpar(col = 4)),
            title = NULL,
            gp=gpar(lwd=2, cex=1),
            hgap = unit(.8, "lines"),
            vgap = unit(.9, "lines"))

grid_legend(x = 'topleft',
            pch = c(1,NA,2,NA),
            col = c(1,2,3,4),
            lwd=NA, 
            lty=c(NA,2,NA,3),
            labels = c("black",'red','green','blue'),
            title = 'Some LONG Title',
            gp_title = gpar(col = 3),
            gp_frame = gpar(col = 4, lty = 2, fill = "transparent"),
            gp_labels = gpar(col = 6),
            gp=gpar(lwd=2, cex=2, col = 1),
            hgap = unit(.8, "lines"),
            vgap = unit(.9, "lines"))

grid_legend(x = .7,
            y = .7,
            pch = c(1,NA,2,NA),
            col = c(1,2,3,4),
            lwd=1, 
            lty=c(NA,2,NA,3),
            labels = c("black",'red','green','blue'),
            title = 'short T',
            gp=gpar(lwd=1, cex=.7,col = 1),
            hgap = unit(.8, "lines"),
            vgap = unit(.9, "lines"))

grid_legend(x = 'bottomright',
            pch = c(1,NA,2,NA),
            col = c(2),
            lwd=NA, 
            lty=c(NA,2,NA,3),
            labels = c("black",'red','green','blue'),
            title = NULL,
            gp=gpar(lwd=2, cex=1,col = 1),
            hgap = unit(.8, "lines"),
            vgap = unit(.9, "lines"))



