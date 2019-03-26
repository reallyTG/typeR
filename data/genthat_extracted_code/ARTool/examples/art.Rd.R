library(ARTool)


### Name: art
### Title: Aligned Rank Transform
### Aliases: art
### Keywords: nonparametric

### ** Examples

## Not run: 
##D data(Higgins1990Table5, package="ARTool")
##D 
##D ## perform aligned rank transform
##D m <- art(DryMatter ~ Moisture*Fertilizer + (1|Tray), data=Higgins1990Table5)
##D 
##D ## see summary data to ensure aligned rank transform is appropriate for this data
##D summary(m)
##D ## looks good (aligned effects sum to 0 and F values on aligned responses
##D ## not of interest are all ~0)
##D 
##D ## we can always look at the anova of aligned data if we want more detail
##D ## to assess the appropriateness of ART.  F values in this anova should all
##D ## be approx 0.
##D anova(m, response="aligned")
##D 
##D ## then we can run an anova on the ART responses (equivalent to anova(m, response="art"))
##D anova(m)
##D 
##D ## if we want post-hoc tests, artlm(m, term) returns the linear model for the
##D ## given term
##D ## which we can then examine using our preferred method (emmeans, glht, etc)
##D ## e.g., pairwise contrasts on Moisture:
##D library(emmeans)
##D emmeans(artlm(m, "Moisture"), pairwise ~ Moisture)
##D 
##D ## pairwise contrasts on Fertilizer:
##D emmeans(artlm(m, "Fertilizer"), pairwise ~ Fertilizer)
##D 
##D ## N.B. The above types of contrasts ARE NOT valid for interactions.
##D ## Instead, use testInteractions from the phia package. For example:
##D library(phia)
##D testInteractions(artlm(m, "Moisture:Fertilizer"), pairwise=c("Moisture", "Fertilizer"))
##D ## For a more in-depth explanation and example, see this vignette:
##D vignette("art-contrasts")
##D 
## End(Not run)




