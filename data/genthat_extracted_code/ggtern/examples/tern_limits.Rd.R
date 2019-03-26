library(ggtern)


### Name: tern_limits
### Title: Restrict Ternary Limits
### Aliases: tern_limits tern_limit limit_tern limits_tern

### ** Examples

#Display a non-zoomed and zoomed plot side by side
data(Feldspar)
df.lims = data.frame(Ab = c(1,.25,.25), 
                     An = c(0,.75,.00), 
                     Or = c(0,.00,.75))
#Build the non-zoomed plot
A = ggtern(Feldspar,aes(Ab,An,Or)) +
 stat_density_tern(geom='polygon',aes(fill=..level..,alpha=..level..)) + 
 geom_point() + 
 geom_mask() + 
 geom_polygon(data=df.lims,color='red',alpha=0,size=0.5) +
 guides(color='none',fill='none',alpha='none') + 
 labs(title = "Non-Zoomed")

#Build the zoomed plot
B = A + 
  tern_limits(T=max(df.lims$An), L=max(df.lims$Ab), R=max(df.lims$Or)) +
  labs(title = "Zoomed")

#Arrange the above plots side by side for illustration
grid.arrange(A,B,ncol=2,top="Demonstration of Limiting Region")



