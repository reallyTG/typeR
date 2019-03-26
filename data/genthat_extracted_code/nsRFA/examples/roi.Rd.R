library(nsRFA)


### Name: roi
### Title: Region of influence
### Aliases: roi roi.hom roi.st.year
### Keywords: cluster

### ** Examples

data(hydroSIMN)
parameters
summary(parameters)

annualflows
summary(annualflows)
x <- annualflows["dato"][,]
cod <- annualflows["cod"][,]

roi(parameters[5,3:5],parameters[-5,3:5],parameters[-5,1])
roi(parameters[5,3:5],parameters[-5,3:5],parameters[-5,1],x,cod)

# roi.hom
#roi.hom(parameters[5,3:5],parameters[-5,3:5],parameters[-5,1],x,cod)
                            # it takes some time
#roi.hom(parameters[5,3:5],parameters[-5,3:5],parameters[-5,1],x,cod,
#        test="AD",limit=.95)      # it takes some time

#roi.hom(parameters[8,3:5],parameters[-8,3:5],
#         parameters[-8,1],x,cod)    # it takes some time


# roi.st.year
roi.st.year(parameters[5,3:5],parameters[-5,3:5],
            parameters[-5,1],x,cod)
roi.st.year(parameters[5,3:5],parameters[-5,3:5],parameters[-5,1],
            x,cod,test="AD",station.year=100)




