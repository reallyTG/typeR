library(ggalluvial)


### Name: stat_alluvium
### Title: Alluvial positions
### Aliases: stat_alluvium

### ** Examples

# illustrate positioning
ggplot(as.data.frame(Titanic),
       aes(y = Freq,
           axis1 = Class, axis2 = Sex, axis3 = Age,
           color = Survived)) +
  stat_stratum(geom = "errorbar") +
  geom_line(stat = "alluvium") +
  stat_alluvium(geom = "pointrange") +
  geom_text(stat = "stratum", label.strata = TRUE) +
  scale_x_discrete(limits = c("Class", "Sex", "Age"))

gg <- ggplot(as.data.frame(Titanic),
             aes(y = Freq,
                 axis1 = Class, axis2 = Sex, axis3 = Age)) +
  geom_stratum() + geom_text(stat = "stratum", label.strata = TRUE) +
  scale_x_discrete(limits = c("Class", "Sex", "Age"))
# use of lode controls
gg + geom_flow(aes(fill = Survived, alpha = Sex), stat = "alluvium",
               aes.bind = TRUE, lode.guidance = "rightward")
# use of lode ordering
lode_ord <- replicate(n = 3, expr = sample(x = 32), simplify = FALSE)
gg + geom_flow(aes(fill = Survived, alpha = Sex), stat = "alluvium",
               lode.ordering = lode_ord)

data(majors)
# omit missing lodes and incident flows
ggplot(majors,
       aes(x = semester, stratum = curriculum, alluvium = student)) +
  geom_alluvium(fill = "darkgrey", na.rm = TRUE) +
  geom_stratum(aes(fill = curriculum), color = NA, na.rm = TRUE) +
  theme_bw()
# reverse the vertical axis (requires an explicit `y` aesthetic)
ggplot(majors,
       aes(x = semester, stratum = curriculum, alluvium = student, y = 1)) +
  geom_alluvium(fill = "darkgrey", na.rm = TRUE) +
  geom_stratum(aes(fill = curriculum), color = NA, na.rm = TRUE) +
  theme_bw() +
  scale_y_reverse()

gg <- ggplot(majors,
             aes(x = semester, stratum = curriculum, alluvium = student,
                 fill = curriculum)) +
  geom_stratum()
# diagram with outlined alluvia and forward-colored flows
gg + geom_flow(stat = "alluvium", lode.guidance = "rightleft",
               color = "black")
# same diagram with students are aggregated into cohorts
gg + geom_flow(stat = "alluvium", lode.guidance = "rightleft",
               color = "black", aggregate.y = TRUE)

## Not run: 
##D data(babynames, package = "babynames")
##D # a discontiguous alluvium
##D bn <- dplyr::filter(babynames,
##D                     prop >= .01 & sex == "F" &
##D                       year > 1962 & year < 1968)
##D ggplot(data = bn,
##D        aes(x = year, alluvium = name, y = prop)) +
##D   geom_alluvium(aes(fill = name, color = name == "Tammy"),
##D                 decreasing = TRUE, show.legend = FALSE) +
##D   scale_color_manual(values = c("#00000000", "#000000"))
##D # filling in missing zeros
##D bn2 <- merge(bn,
##D              expand.grid(year = unique(bn$year), name = unique(bn$name)),
##D              all = TRUE)
##D bn2$prop[is.na(bn2$prop)] <- 0
##D ggplot(data = bn2,
##D        aes(x = year, alluvium = name, y = prop)) +
##D   geom_alluvium(aes(fill = name, color = name == "Tammy"),
##D                 decreasing = TRUE, show.legend = FALSE) +
##D   scale_color_manual(values = c("#00000000", "#000000"))
## End(Not run)



