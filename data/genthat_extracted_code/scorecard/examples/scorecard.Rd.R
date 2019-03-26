library(scorecard)


### Name: scorecard
### Title: Creating a Scorecard
### Aliases: scorecard

### ** Examples

## Not run: 
##D # load germancredit data
##D data("germancredit")
##D 
##D # filter variable via missing rate, iv, identical value rate
##D dt_sel = var_filter(germancredit, "creditability")
##D 
##D # woe binning ------
##D bins = woebin(dt_sel, "creditability")
##D dt_woe = woebin_ply(dt_sel, bins)
##D 
##D # glm ------
##D m = glm(creditability ~ ., family = binomial(), data = dt_woe)
##D # summary(m)
##D 
##D # Select a formula-based model by AIC
##D m_step = step(m, direction="both", trace=FALSE)
##D m = eval(m_step$call)
##D # summary(m)
##D 
##D # predicted proability
##D # dt_pred = predict(m, type='response', dt_woe)
##D 
##D # performace
##D # ks & roc plot
##D # perf_eva(dt_woe$creditability, dt_pred)
##D 
##D # scorecard
##D # Example I # creat a scorecard
##D card = scorecard(bins, m)
##D card2 = scorecard2(bins=bins, dt=germancredit, y='creditability',
##D   x=c("status.of.existing.checking.account", "duration.in.month", "credit.history",
##D    "purpose", "credit.amount", "savings.account.and.bonds",
##D    "present.employment.since", "installment.rate.in.percentage.of.disposable.income",
##D    "personal.status.and.sex", "other.debtors.or.guarantors", "property",
##D    "age.in.years", "other.installment.plans", "housing"))
##D 
##D # credit score
##D # Example I # only total score
##D score1 = scorecard_ply(dt, card)
##D 
##D # Example II # credit score for both total and each variable
##D score2 = scorecard_ply(dt, card, only_total_score = F)
## End(Not run)



