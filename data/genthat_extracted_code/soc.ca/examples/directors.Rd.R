library(soc.ca)


### Name: directors
### Title: Directors dataset
### Aliases: directors
### Keywords: data

### ** Examples

## Not run: 
##D data(directors)
##D attach(directors)
##D 
##D 
##D active      <- data.frame(careerprofile_maclean_cat, careerfoundation_maclean_cat,
##D                           years_between_edu_dir_cat, time_in_corp_before_ceo_cat,
##D                           age_as_ceo_cat, career_changes_cat2, mba, abroad, hd, phd,
##D                           education, author, placeofbirth, familyclass_bourdieu,
##D                           partnersfamily_in_whoswho, family_in_whoswho)
##D 
##D sup       	<- data.frame(size_prestige, ownership_cat_2, sector, location)
##D 
##D id          <- navn
##D 
##D options(passive = c("MISSING", "Missing", "Irrelevant", "residence_value_cat2: Udlandet"))
##D 
##D result      <- soc.mca(active, sup, id)
##D 
##D result
##D 
##D # Contribution
##D contribution(result, 1)
##D contribution(result, 2)
##D contribution(result, 3)
##D contribution(result, 1, all = TRUE)
##D contribution(result, 1, indices = TRUE)
##D contribution(result, 1, mode = "mod")
##D contribution(result, mode = "variable")
##D 
##D # Individuals
##D contribution(result, 1, mode = "ind")
##D contribution(result, 2, mode = "ind")
##D 
##D 
##D # Table of variance
##D variance(result)
##D 
##D # Invert
##D result      <- invert(result, c(1, 2, 3))
##D 
##D # Export and assign label
##D # export.label(result)
##D 
##D # result      <- assign.label(result,
##D #  file = "https://raw.github.com/Rsoc/soc.ca/master/extra/director_labels.csv")
##D 
##D 
##D 
##D # Add.n
##D result      <- add.to.label(result)
##D contribution(result, 2)
##D 
##D 
##D # The result object or "soc.ca" object
##D str(result)
##D dim1 <- result$coord.ind[, 1]
##D qplot(dim1)
##D 
##D # Quadrant
##D quad      <- create.quadrant(result)
##D table(quad)
##D quad      <- create.quadrant(result, cut.min = 0, cut.max = 0)
##D table(quad)
##D 
##D 
##D # Map of individuals
##D map.ind(result)
##D map.ind(result, dim = c(2, 1), label = TRUE)
##D map.ind(result, dim = c(2, 1), point.size = 3, point.shape = 2)
##D map.ind(result, dim = c(2, 1), map.title = "The top 100 Danish CEO's",
##D point.color = quad)
##D # Map of the individuals colored by contribution
##D map.ind(result, point.color = result$ctr.ind[, 1],
##D  point.shape = 18) + scale_color_continuous(low = "white", high = "red")
##D 
##D 
##D # Map of contributing modalities
##D map.ctr(result, dim = c(2, 1))
##D map.ctr(result, dim = c(2, 1), ctr.dim = 2)
##D map.ctr(result, point.size = 3)
##D 
##D map.active(result, dim = c(2, 1))
##D map.sup(result, dim = c(2, 1))
##D 
##D # Plot.list
##D 
##D # Selecting specific active modalities
##D select      <- c("Career start: Corporation (n:57)", "No Phd (n:92)")
##D boo.select  <- match(select, result$names.mod)
##D map.select(result, list.mod = boo.select)
##D 
##D highcor     <- which(result$cor.mod[, 1] >= 0.2) 
##D map.select(result, list.mod = highcor)
##D 
##D # Selecting specific supplementary modalities
##D 
##D highdim3    <- which(sqrt(result$coord.sup[, 3]^2) >= 0.5)
##D map.select(result, list.sup = highdim3)
##D 
##D # Selecting specific individuals based on a certain criteria
##D 
##D forfatter   <- author == "Forfatter"
##D map.select(result, list.ind = forfatter)
##D 
##D # Combining it all
##D map.select(result, list.mod = highcor, list.sup = highdim3, list.ind = forfatter)
##D 
##D # Add points to an existing plot
##D ctrplot     <- map.ctr(result, ctr.dim = 1, point.color = "red")
##D map.add(result, ctrplot, data.type = "ctr", ctr.dim = 2, point.color = "blue")
##D 
##D # Using the list option in add.points
##D forfatter    <- author == "Forfatter"
##D map.add(result, ctrplot, data.type = "select", list.ind = forfatter, colour = "purple")
##D 
##D # Using the list option in add.points to add labels to only a part of the cloud of individuals
##D forfatter     <- author == "Forfatter"
##D notforfatter  <- author != "Forfatter"
##D map.forfatter <- map.select(result, list.ind = notforfatter, label = FALSE)
##D map.forfatter
##D map.forfatter <- map.add(result, map.forfatter, data.type = "select", list.ind = forfatter)
##D map.forfatter
##D 
##D # Plotting all the modalities of one individual
##D result2       <- soc.ca(active, sup, id)
##D individual    <- which(id == "Lars Larsen")
##D ind.mat       <- indicator(active)
##D modalities    <- names(which(ind.mat[individual, ] == 1))
##D mod.ind       <- match(modalities, result2$names.mod)
##D 
##D lars          <- map.select(result2, list.mod = mod.ind)
##D map.add(result2, lars, data.type = "select", list.ind = individual, colour = "red")
##D 
##D # Adding concentration ellipses to an existing plot
##D el.forfatter  <- map.ellipse(result, map.forfatter, author)
##D el.forfatter
## End(Not run)



