library(ggtern)


### Name: theme_zoom_X
### Title: Zoom on Plot Region
### Aliases: theme_zoom_X theme_zoom theme_zoom_T theme_zoom_L theme_zoom_R
###   theme_zoom_center theme_zoom_M

### ** Examples

#Default Plot
data(Feldspar)
base = ggtern(Feldspar,aes(Ab,An,Or)) +
       theme_bw(8) +
       geom_density_tern() + 
       geom_point() + 
       labs(title="Original")

#Zoom on Left Region
A = base + theme_zoom_L(0.5) + labs(title="theme_zoom_L")

#Zoom on Right Region
B = base + theme_zoom_R(0.5) + labs(title="theme_zoom_R")

#Zoom on Top Region
C = base + theme_zoom_T(0.5) + labs(title="theme_zoom_T")

#Zoom on Center Region
D = base + theme_zoom_center(0.5) + labs(title="theme_zoom_center")

#Put all together for comparisons sake
grid.arrange(arrangeGrob(base), 
             arrangeGrob(A,B,nrow=1), 
             arrangeGrob(C,D,nrow=1), 
             ncol=1, heights=c(2,1,1),
             top = "Comparison of Zooming Functions")




