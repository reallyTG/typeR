library(hypervolume)


### Name: hypervolume_general_model
### Title: Generates hypervolume by sampling from arbitrary model object.
### Aliases: hypervolume_general_model

### ** Examples

data(iris)
iris[,"Species"] <- iris[,"Species"] == "setosa"
m_glm = glm(Species~.,data=iris)

hv_general_glm = hypervolume_general_model(m_glm, 
  range.box=padded_range(iris[,1:4]),type='response')
plot(hv_general_glm)	
	



