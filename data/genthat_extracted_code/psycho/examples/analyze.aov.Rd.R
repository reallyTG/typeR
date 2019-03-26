library(psycho)


### Name: analyze.aov
### Title: Analyze aov and anova objects.
### Aliases: analyze.aov

### ** Examples

## Not run: 
##D library(psycho)
##D 
##D df <- psycho::affective
##D 
##D x <- aov(df$Tolerating ~ df$Salary)
##D x <- aov(df$Tolerating ~ df$Salary * df$Sex)
##D 
##D x <- anova(lm(df$Tolerating ~ df$Salary * df$Sex))
##D 
##D 
##D summary(analyze(x))
##D print(analyze(x))
##D 
##D df <- psycho::emotion %>%
##D   mutate(Recall = ifelse(Recall == TRUE, 1, 0)) %>%
##D   group_by(Participant_ID, Emotion_Condition) %>%
##D   summarise(Recall = sum(Recall) / n())
##D 
##D x <- aov(Recall ~ Emotion_Condition + Error(Participant_ID), data = df)
##D x <- anova(lmerTest::lmer(Recall ~ Emotion_Condition + (1 | Participant_ID), data = df))
##D analyze(x)
##D summary(x)
## End(Not run)




