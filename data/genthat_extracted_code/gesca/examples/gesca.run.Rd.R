library(gesca)


### Name: gesca.run
### Title: Fit Structural Equation Models using Generalized Structural
###   Component Analysis
### Aliases: gesca.run

### ** Examples


library(gesca)
data(gesca.rick2) # Organizational identification example of Bagozzi
                  # has the grouping variable "gender"

# Model specification
myModel <- "
		# Measurement model 
		OP =~ cei1 + cei2 + cei3
		OI =~ ma1 + ma2 + ma3
		AC_J =~ orgcmt1 + orgcmt2 + orgcmt3
		AC_L =~ orgcmt5 + orgcmt6 + orgcmt8
		
		# Structural model 
		OI ~ OP
		AC_J ~ OI
		AC_L ~ OI
"

# In case the user wants to apply a single-group analysis ignoring the group information:
# rick2.GSCA <- gesca.run(myModel, gesca.rick2)

# Run a multiple-group GSCA with the grouping variable gender:
# GSCA.group <- gesca.run(myModel, gesca.rick2, group.name = "gender")
# summary(GSCA.group)
GSCA.group.nbt0 <- gesca.run(myModel, gesca.rick2, group.name ="gender", nbt = 0)
summary(GSCA.group.nbt0)		# no bootstrapped std errors
effectmeasures(GSCA.group.nbt0)

# Models with the imposition of constraints on parameters across groups
# (1) equality constraints
# equl.cstr <- gesca.run(myModel, gesca.rick2, group.name ="gender",
#                  group.equal = c("loadings", "paths"))

# (2) identical loadings but different path coefficients
# equl.loadings <- gesca.run(myModel, gesca.rick2, group.name ="gender",
#                      group.equal = c("loadings"))

# (3) More constraints across groups with some formative indicators
myModel.con <- "
		OP =~ cei1 + cei2 + cei3
		OI(0) =~ ma1 + ma2 + ma3
		AC_J =~ c(g,g)*orgcmt1 + c(h,h)*orgcmt2 + c(i,i)*orgcmt3
		AC_L(0) =~ orgcmt5 + orgcmt6 + orgcmt8

		OI ~ 0.37*OP
		AC_J ~ OI
		AC_L ~ OI
"
Const.Form <- gesca.run(myModel.con, gesca.rick2, group.name ="gender", nbt = 50)
summary(Const.Form)


# Second-order latent variable modeling
myModel5 <- "
		# Measurement model 
		OP =~ cei1 + cei2 + cei3 + cei4 + cei5 + cei6 + cei7 + cei8
		OI =~ ma1 + ma2 + ma3 + ma4 + ma5 + ma6
		AC_J =~ orgcmt1 + orgcmt2 + orgcmt3 + orgcmt7
		AC_L =~ orgcmt5 + orgcmt6 + orgcmt8

		# Second-order latents 
		AC =: AC_J + AC_L

		# Structural model 
		OI ~ OP
		AC ~ OI
"

# second.GSCA <- gesca.run(myModel5, gesca.rick2, group.name = "gender")
# summary(second.GSCA)
second.GSCA.nbt0 <- gesca.run(myModel5, gesca.rick2, group.name = "gender", nbt=0)
summary(second.GSCA.nbt0)




