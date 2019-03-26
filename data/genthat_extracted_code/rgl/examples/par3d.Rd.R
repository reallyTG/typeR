library(rgl)


### Name: par3d
### Title: Set or Query RGL Parameters
### Aliases: par3d open3d r3dDefaults getr3dDefaults
### Keywords: dynamic

### ** Examples

    r3dDefaults
    open3d()
    shade3d(cube3d(color = rep(rainbow(6), rep(4, 6))))
    save <- par3d(userMatrix = rotationMatrix(90*pi/180, 1, 0, 0))
    highlevel()  # To trigger display
    save
    par3d("userMatrix")    
    par3d(save)
    highlevel()
    par3d("userMatrix")



