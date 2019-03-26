library(ggtern)


### Name: theme_mesh
### Title: Create Grid Mesh
### Aliases: theme_mesh

### ** Examples

#Default example of a target n=10 mesh
ggtern() + 
 theme_mesh(10)

#Default example, of a target n=5 mesh, with limiting region
ggtern() + 
 theme_mesh(5,T=.5,L=.5,R=.5)



