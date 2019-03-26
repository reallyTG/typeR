library(lavaSearch2)


### Name: createGrid
### Title: Create a Mesh for the Integration
### Aliases: createGrid
### Keywords: internal

### ** Examples

createGrid <- lavaSearch2:::createGrid

## no z 
gridInt_2d <- createGrid(5, d.y = 1, xmin = 0, xmax = 4, 
                         d.z = 0, fine = FALSE, double = FALSE)
gridExt_2d <- createGrid(5, d.y = 1, xmin = 0, xmax = 4, 
                         d.z = 0, fine = FALSE, double = TRUE)

gridInt_4d <- createGrid(5, d.y = 3, xmin = 0, xmax = 4, 
                         d.z = 0, fine = FALSE, double = FALSE)
gridExt_4d <- createGrid(5, d.y = 3, xmin = 0, xmax = 4, 
                         d.z = 0, fine = FALSE, double = TRUE)

gridInt_2d <- createGrid(5, d.y = 1, xmin = 0, xmax = 4, 
                         d.z = 0, fine = TRUE, double = FALSE)

##  z
gridIntZ1_2d <- createGrid(5, d.y = 1, xmin = 0, xmax = 4, 
                           d.z = 1, zmax = 2, fine = FALSE, double = FALSE)
gridExtZ1_2d <- createGrid(5, d.y = 1, xmin = 0, xmax = 4, 
                           d.z = 1, zmax = 2, fine = FALSE, double = TRUE)
 
gridIntZ2_4d <- createGrid(5, d.y = 3, xmin = 0, xmax = 4, 
                           d.z = 2, zmax = 2, fine = FALSE, double = FALSE)
gridExtZ2_4d <- createGrid(5, d.y = 3, xmin = 0, xmax = 4, 
                           d.z = 2, zmax = 2, fine = FALSE, double = TRUE)




