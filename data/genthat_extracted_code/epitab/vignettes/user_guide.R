## ---- message=F, warning=F-----------------------------------------------
library(epitab)
library(dplyr)

## ------------------------------------------------------------------------
set.seed(17)
treat <- data.frame(age=abs(rnorm(100, 60, 20)),
                    sex=factor(sample(c("M", "F"), 100, replace=T)),
                    variant=factor(sample(c("A", "B"), 100, replace=T)),
                    treated=factor(sample(c("Yes", "No"), 100, replace=T), levels=c("Yes", "No")))
treat$agebin <- cut(treat$age, breaks=c(0, 40, 60, 80, 9999),labels=c("0-40", "41-60", "61-80", "80+")) 

## ------------------------------------------------------------------------
treat %>%
    head() %>%
    knitr::kable()

## ------------------------------------------------------------------------
contingency_table(independents=list("Age"="agebin",
                                    "Sex"="sex"),
                  outcomes=list("Treated"="treated"),
                  crosstab_funcs=list(freq()),
                  data=treat)

## ------------------------------------------------------------------------
contingency_table(independents=list("Age"="agebin",
                                    "Sex"="sex"),
                  outcomes=list("Treated"="treated"),
                  crosstab_funcs=list(freq(proportion = "none")),
                  marginal=FALSE,
                  data=treat)

## ------------------------------------------------------------------------
contingency_table(independents=list("Age"="agebin",
                                    "Sex"="sex"),
                  outcomes=list("Treated"="treated", "Variant"="variant"),
                  crosstab_funcs=list(freq()),
                  data=treat)

## ------------------------------------------------------------------------
contingency_table(independents=list("Age"="agebin",
                                    "Sex"="sex"),
                  outcomes=list("Treated"="treated"),
                  crosstab_funcs=list(freq()),
                  col_funcs=list("Mean age"=summary_mean("age")),
                  data=treat)

## ------------------------------------------------------------------------
contingency_table(independents=list("Age"="agebin",
                                    "Sex"="sex"),
                  outcomes=list("Treated"="treated"),
                  crosstab_funcs=list(freq()),
                  col_funcs=list("Mean age"=summary_mean("age"),
                                 "Median age"=summary_median("age")),
                  data=treat)

## ------------------------------------------------------------------------
contingency_table(list("Age"="agebin",
                       "Sex"="sex"),
                  outcomes=list("Treated"='treated'),
                  data=treat, 
                  crosstab_funcs=list(freq()),
                  row_funcs=list("OR"=odds_ratio('treated'))
                 )

## ------------------------------------------------------------------------
contingency_table(list("Age"="agebin",
                       "Sex"="sex"),
                  outcomes=list("Treated"='treated'),
                  data=treat, 
                  crosstab_funcs=list(freq()),
                  row_funcs=list("OR"=odds_ratio('treated', relevel_baseline=TRUE),
                                 "Adj OR"=odds_ratio('treated', adjusted=TRUE, 
                                                     relevel_baseline=TRUE))
                 )

## ------------------------------------------------------------------------
contingency_table(independents=list("Age"="agebin",
                                    "Sex"="sex"),
                  outcomes=list("Treated"="treated"),
                  crosstab_funcs=list(freq()),
                  col_funcs=list("Mean age"=summary_mean("age"),
                                 "Median age"=summary_median("age")),
                  row_funcs=list("OR"=odds_ratio('treated', relevel_baseline=TRUE),
                                 "Adj OR"=odds_ratio('treated', adjusted=TRUE, 
                                                     relevel_baseline=TRUE)),
                  data=treat)

## ------------------------------------------------------------------------
contingency_table(independents=list("Age"="agebin",
                                    "Sex"="sex"),
                  outcomes=list("Treated"="treated", "Disease variant"="variant"),
                  crosstab_funcs=list(freq()),
                  col_funcs=list("Mean age"=summary_mean("age"),
                                 "Median age"=summary_median("age")),
                  row_funcs=list("Treatment OR"=odds_ratio('treated', relevel_baseline=TRUE),
                                 "Disease variant OR"=odds_ratio('variant', 
                                                                 relevel_baseline=TRUE)),
                  data=treat)

## ------------------------------------------------------------------------
contingency_table(independents=list("Age"="agebin",
                                    "Sex"="sex"),
                  row_funcs=list("OR"=odds_ratio('treated', relevel_baseline=TRUE),
                                 "Adj OR"=odds_ratio('treated', adjusted=TRUE, 
                                                     relevel_baseline=TRUE)),
                  data=treat)

## ------------------------------------------------------------------------
contingency_table(independents=list("Age"="agebin",
                                    "Sex"="sex"),
                  outcomes=list("Treated"='treated'),
                  crosstab_funcs=list(freq()),
                  row_funcs=list("OR"=odds_ratio('treated'),
                                 "Adj OR"=odds_ratio('treated', adjusted=TRUE)),
                  col_funcs=list("Mean age"=summary_mean("age")),
                  data=treat) %>%
              neat_table() %>%
              kableExtra::kable_styling(bootstrap_options=c("striped", "hover"), 
                                        full_width=FALSE)

## ---- eval=F-------------------------------------------------------------
#  contingency_table(independents=list("Age"="agebin",
#                                      "Sex"="sex"),
#                    outcomes=list("Treated"='treated'),
#                    crosstab_funcs=list(freq()),
#                    row_funcs=list("OR"=odds_ratio('treated'),
#                                   "Adj OR"=odds_ratio('treated', adjusted=TRUE)),
#                    col_funcs=list("Mean age"=summary_mean("age")),
#                    data=treat) %>%
#                neat_table('latex', booktabs=TRUE) %>%
#                kableExtra::kable_styling(font_size=8)

## ------------------------------------------------------------------------
contingency_table(list("Age"="agebin",
                                    "Sex"="sex"),
                               outcomes=list("Treated"='treated'),
                               crosstab_funcs=list(freq()),
                               row_funcs=list("OR"=odds_ratio('treated'),
                                              "Adj OR"=odds_ratio('treated', adjusted=TRUE)),
                               data=treat)$mat %>% 
        knitr::kable("html") %>%
        kableExtra::kable_styling(bootstrap_options="striped")

## ---- eval=F-------------------------------------------------------------
#  tab <- contingency_table(independents=list("Age"="agebin",
#                                             "Sex"="sex"),
#                           outcomes=list("Treated"="treated"),
#                           crosstab_funcs=list(freq()),
#                           col_funcs=list("Mean age"=summary_mean("age"),
#                                          "Median age"=summary_median("age")),
#                           row_funcs=list("OR"=odds_ratio('treated', relevel_baseline=TRUE),
#                                          "Adj OR"=odds_ratio('treated', adjusted=TRUE,
#                                                              relevel_baseline=TRUE)),
#                           data=treat)
#  write.table(tab$mat, "mytable.csv", row.names=FALSE, col.names=FALSE, sep=',')

## ------------------------------------------------------------------------
proportion <- function(data, outcome_level=NULL, outcome_name=NULL, independent_level=NULL, independent_name=NULL) {
    if (!is.null(outcome_level) && !is.null(outcome_name))
        data <- data[data[[outcome_name]] == outcome_level, ]
    
    count <- if (!is.null(independent_level) && !is.null(independent_name)) {
        sum(data[[independent_name]] == independent_level)
    } else {
        nrow(data)
    }
    
    proportion <- count / nrow(data)
    sprintf("%0.1f%%", proportion*100)
}

## ------------------------------------------------------------------------
contingency_table(independents=list("Age"="agebin",
                                    "Sex"="sex"),
                  outcomes=list("Treated"="treated"),
                  crosstab_funcs=list(proportion),
                  data=treat)

## ------------------------------------------------------------------------
meanage_sd <- function(data, outcome_level=NULL, outcome_name=NULL) {
    if (!is.null(outcome_level) && !is.null(outcome_name)) 
        data <- data[data[[outcome_name]] == outcome_level, ]
    mean <- round(mean(data[['age']]), 2)
    sd <- round(sd(data[['age']]), 2)
    paste0(mean, " (", sd, ")")
}

## ------------------------------------------------------------------------
contingency_table(independents=list("Age"="agebin",
                                    "Sex"="sex"),
                  outcomes=list("Treated"="treated"),
                  crosstab_funcs=list(freq()),
                  col_funcs=list("Mean age"=summary_mean("age"),
                                 "Mean age (sd)"=meanage_sd),
                  data=treat)

## ------------------------------------------------------------------------
lr <- function(data, var=NULL, all_vars=NULL) {
    if (is.null(var) || is.null(all_vars)) {
        return("")
    }
    levs <- levels(data[[var]])
    form <- as.formula(paste('age ~', var))
    mod <- lm(form, data)
    coefs <- c(coef(mod), 1)  # Add baseline as 1
    # coefficients are named with <variable><level>
    labels <- paste0(var, levs)
    # set baseline name in coefficients vector
    names(coefs)[length(coefs)] <- labels[1]
    round(coefs[labels], 3)
}

## ------------------------------------------------------------------------
contingency_table(list("Age"="agebin",
                       "Sex"="sex"),
                  outcomes=list("Treated"='treated'),
                  data=treat, 
                  crosstab_funcs=list(freq()),
                  row_funcs=list("Regression on age"=lr)
                 )

