library(vardpoor)


### Name: lingpg
### Title: Linearization of the gender pay (wage) gap.
### Aliases: lingpg
### Keywords: Linearization

### ** Examples

data(ses)


dati <- data.table(ID = paste0("V", 1 : nrow(ses)), ses)
setnames(dati, "sex", "sexf")
dati[sexf == "male", sex:= 1]
dati[sexf == "female", sex:= 2]


# Full population
gpgs1 <- lingpg(Y = "earningsHour", gender = "sex",
                id = "ID", weight = "weights",
                dataset = dati)
gpgs1$value

## Not run: 
##D # Domains by education
##D gpgs2 <- lingpg(Y = "earningsHour", gender = "sex",
##D                 id = "ID", weight = "weights",
##D                 Dom = "education", dataset = dati)
##D gpgs2$value
##D 
##D # Sort variable
##D gpgs3 <- lingpg(Y = "earningsHour", gender = "sex",
##D                 id = "ID", weight = "weights",
##D                 sort = "ID", Dom = "education",
##D                 dataset = dati)
##D gpgs3$value
##D 
##D # Two survey periods
##D dati[, year := 2010]
##D dati2 <- copy(dati)
##D dati2[, year := 2011]
##D dati <- rbind(dati, dati2)
##D gpgs4 <- lingpg(Y = "earningsHour", gender = "sex",
##D                 id = "ID", weight = "weights", 
##D                 sort = "ID", Dom = "education",
##D                 period = "year", dataset = dati)
##D gpgs4$value
##D names(gpgs4$lin)
## End(Not run)



