library(cregg)


### Name: amce_diffs
### Title: Preference Heterogeneity Diagnostics
### Aliases: amce_diffs cj_anova mm_diffs

### ** Examples

data("immigration")
# Test for heterogeneity by profile order
cj_anova(immigration, ChosenImmigrant ~ Gender + Education + LanguageSkills, by = ~ contest_no)

# Test for heterogeneity by CountryOfOrigin feature
cj_anova(immigration, ChosenImmigrant ~ Gender + Education, by = ~ CountryOfOrigin)

## No test: 
# Differences in MMs by Gender feature
mm_diffs(immigration, ChosenImmigrant ~ LanguageSkills + Education, ~ Gender, id = ~ CaseID)

# Differences in AMCEs by Gender feature (i.e., feature interactions)
amce_diffs(immigration, ChosenImmigrant ~ LanguageSkills + Education, ~ Gender, id = ~ CaseID)
## End(No test)

# preferences differ for Male and Female immigrants with 'Broken English' ability
(m1 <- mm_diffs(immigration, ChosenImmigrant ~ LanguageSkills, ~ Gender, id = ~ CaseID))

# yet differences in conditional AMCEs  depend on the reference category
amce_diffs(immigration, ChosenImmigrant ~ LanguageSkills, ~ Gender, id = ~ CaseID)
immigration$LanguageSkills2 <- relevel(immigration$LanguageSkills, "Used Interpreter")
amce_diffs(immigration, ChosenImmigrant ~ LanguageSkills2, ~ Gender, id = ~ CaseID)

# while differences in MMs do not depend on the reference cateory
(m2 <- mm_diffs(immigration, ChosenImmigrant ~ LanguageSkills2, ~ Gender, id = ~ CaseID))




