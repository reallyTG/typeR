library(TeachingDemos)


### Name: rotate.cloud
### Title: Interactively rotate 3D plots
### Aliases: rotate.cloud rotate.persp rotate.wireframe
### Keywords: dynamic hplot

### ** Examples


if(interactive()){
rotate.cloud(Sepal.Length ~ Petal.Length*Petal.Width, data=iris)

rotate.wireframe(volcano)

z <- 2 * volcano        # Exaggerate the relief
x <- 10 * (1:nrow(z))   # 10 meter spacing (S to N)
y <- 10 * (1:ncol(z))   # 10 meter spacing (E to W)
rotate.persp(x,y,z)
}



