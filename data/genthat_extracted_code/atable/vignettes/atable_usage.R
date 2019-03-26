## ----require, echo=FALSE, results='hide', message=FALSE, warning=FALSE----

require(knitr)
require(Hmisc)
require(datasets)
require(officer)
require(flextable)
require(utils)
require(atable)


## ----global_chunk_options, echo = FALSE, results='hide'------------------

opts_chunk$set(message = FALSE)
opts_chunk$set(echo = FALSE)
opts_chunk$set(warning = FALSE)
opts_chunk$set(results = "hide")


## ----ToothGrowth atable, echo=TRUE, results='asis'-----------------------

# apply atable
the_table <- atable::atable(ToothGrowth,
                            target_cols = "len",
                            group_col = "supp",
                            split_cols = "dose",
                            format_to = "Latex")

# send to LaTeX
Hmisc::latex(the_table,
             file = "",
             title = "",
             label = "tab:ToothGrowthatable",
             caption = "ToothGrowth analysed by atable.",
             caption.lot = "ToothGrowth analysed by atable",
             rowname = NULL)


## ----mtcars atable, echo=TRUE, results='asis'----------------------------

# all columns of mtcars are numeric, although some are
# better represented as factors
mtcars <- within(datasets::mtcars, {gear <- factor(gear)})

# apply atable
the_table <- atable::atable(mpg + hp + gear + qsec ~ cyl | vs,
                            mtcars,
                            format_to = "Latex")
# atable also has a formula method.
# The left side contains the target columns, the right side contains grouping
# and splitting columns separated by the pipe |

# send to LaTeX
Hmisc::latex(the_table,
             file = "",
             title = "",
             label = "tab:mtcarsatable",
             caption = "mtcars analysed by atable.",
             caption.lot = "mtcars analysed by atable",
             rowname = NULL)

## ----Extract specific values from the table, echo=TRUE, results='markup'----

unformatted <- atable::atable(mpg + hp + gear + qsec ~ cyl | vs,
                              mtcars,
                              format_to = "Raw")
# format_to = "Raw" tells atable to skip formatting.

# Extract specific values
unformatted$statistics_result$mpg[[2]]$mean
unformatted$statistics_result$mpg[[2]]$sd

## ----Localisation, echo=TRUE, results='asis'-----------------------------

# Set german words for the table:
atable::atable_options(labels_TRUE_FALSE = c("Ja", "Nein"),
                       labels_Mean_SD = "Mittelwert (SD)" ,
                       labels_valid_missing = "Ok (fehlend)",
                       colname_for_observations = "Anzahl",
                       colname_for_value = "Wert",
                       colname_for_group = "Gruppe",
                       replace_NA_by = "fehlend")

# apply atable
the_table <- atable::atable(atable::test_data,
             target_cols = c("Logical", "Numeric", "Factor", "Ordered"))

# reset all options to default
atable_options_reset()

# send to LaTeX
Hmisc::latex(the_table,
             file = "",
             title = "",
             label = "tab:Localisation",
             caption = "Localised atable. All identifiers produced by atable are
                        now translated to german; names of variables and factor
                        labels supplied in the data.frame remain unchanged.",
             caption.lot = "Localised atable",
             rowname = NULL)



## ----Word, echo=TRUE-----------------------------------------------------

for_Word <- atable::atable(mpg + hp + gear + qsec ~ cyl | vs, mtcars,
                           format_to = "Word")

# print in Word with packages flextable and officer

MyFTable <- flextable::regulartable(data = for_Word)
# left aligned first column:
MyFTable <- flextable::align(MyFTable, align = "left", j = 1)

# save on disc. Not run here:
# doc <- officer::read_docx()
# doc <- flextable::body_add_flextable(doc, value = MyFTable)
# print(doc, target = "atable and Word.docx")


## ----HTML, echo=TRUE-----------------------------------------------------

for_HTML <- atable::atable(mpg + hp + gear + qsec ~ cyl | vs,
                           mtcars,
                           format_to = "HTML")

options(knitr.kable.NA = '')
# knitr::kable(for_HTML, caption="HTML table with atable") # not run.


## ----Tabelle with stats and test, results='asis', echo=FALSE-------------



DD <- matrix(
  c(
    c('scale_of_measurement', 'nominal', 'ordinal', 'interval'),

    c('statistic', 'counts occurences of every level', 'as factor', 'Mean and standard deviation'),

    c('two_sample_test', 'chi^2 test', 'Wilcoxon Rank-Sum test', 'Kolmogorov-Smirnov Test'),

    c('effect_size', "two levels: odds ratio, else Cramér's phi", "Cliff's Delta", "Cohen's d"),

    c('multi_sample_test', 'chi^2 test', 'Kruskal-Wallis test', 'Kruskal-Wallis test')
  ),
  ncol = 4,
  byrow = TRUE,
  dimnames = list(NULL, c('R class', 'factor', 'ordered', 'numeric'))
)


DD <- as.data.frame(DD)

DD[] <- lapply(DD, gsub, pattern = "_", replacement = " ")

DD <- atable::translate_to_LaTeX(DD, greek = TRUE)

Hmisc::latex(DD,
      file = "",
      title = "",
      label = "tab:classesandatable",
      caption = "Classes and atable. Table shows the descriptive statistics and hypothesis tests, that are
      applied to the three R classes factor, ordered and numeric. Table also shows the appropriate scale
      of measurement. Class character and logical are treated as nominal scaled variables.",
      caption.lot = "Classes and atable",
      rowname = NULL,
      first.hline.double = FALSE,
      collabel.just = c("l|", "l", "l", "l"),
      col.just = c("L{3.5cm}|", "L{3.5cm}", "L{4cm}", "L{4cm}"),
      where="!htbp")

## ----Replace two_sample_htest.numeric, results='markup', echo=TRUE-------
# write a new function:
new_two_sample_htest_numeric <- function(value, group, ...){

  d <- data.frame(value = value, group = group)

  group_levels <- levels(group)
  x <- subset(d, group %in% group_levels[1], select = "value", drop = TRUE)
  y <- subset(d, group %in% group_levels[2], select = "value", drop = TRUE)

  ks_test_out <- stats::ks.test(x, y)
  t_test_out <- stats::t.test(x, y)
  cohen_d_out <- effsize::cohen.d(x, y, na.rm = TRUE)

  # return p-values of both tests
  out <- list(p_ks = ks_test_out$p.value,
              p_t = t_test_out$p.value,
              cohens_d = cohen_d_out$estimate)

  return(out)
}


## ----assignInNamespace, results='markup', echo=TRUE----------------------

utils::assignInNamespace(x = "two_sample_htest.numeric",
                         value = new_two_sample_htest_numeric,
                         ns = "atable",
                         envir = as.environment("package:atable") )

## ----Modify statistics numeric, results='markup', echo=TRUE--------------


new_statistics_numeric <- function(x, ...){

  statistics_out <- list(Median = median(x, na.rm = TRUE),
                         MAD = mad(x, na.rm = TRUE),
                         Mean = mean(x, na.rm = TRUE),
                         SD = sd(x, na.rm = TRUE))

  return(statistics_out)
}

# Add the new metdhod to atable's namespace
utils::assignInNamespace(x = "statistics.numeric",
                         value = new_statistics_numeric,
                         ns = "atable",
                         envir = as.environment("package:atable") )



## ----Print modify numeric, echo=TRUE, results='asis'---------------------

the_table <-  atable::atable(atable::test_data,
                             target_cols = "Numeric",
                             group_col = "Group",
                             split_cols = "Split1",
                             format_to = "Latex")

Hmisc::latex(the_table,
             file = "",
             title = "",
             label = "tab:modifynumeric",
             caption = "Modified atable also calculates the median, MAD,
             t-test and KS-test.",
             caption.lot = "Modified atable",
             rowname = NULL)


## ----Methods for statistics, results='markup', echo=TRUE-----------------

statistics.Date <- function(x, ...){

  out <- list(
    Min = min(x, na.rm = TRUE),
    Median = median(x, na.rm = TRUE),
    Max = max(x, na.rm = TRUE)
  )

  class(out) <- c("statistics_Date", class(out))
  # We will need this new class later to specify the format

  return(out)
}


## ----Methods for format, results='markup', echo=TRUE---------------------
format_statistics.statistics_Date <- function(x, ...){

  min_max <- paste0(x$Min, "; ", x$Max)
  Median <- as.character(x$Median)


  out <- data.frame(
    tag = factor(c("Min Max", "Median"), levels = c("Min Max", "Median")),
    value = c(min_max, Median),
    stringsAsFactors = FALSE)
  # the factor needs levels for the non-alphabetic order
  return(out)
}


## ----Methods for Date print, echo=TRUE, results='asis'-------------------
the_table <-  atable::atable(atable::test_data,
                             target_cols = "Date",
                             format_to = "Latex")

Hmisc::latex(the_table,
             file = "",
             title = "",
             label = "tab:addedDate",
             caption = "atable with added methods for class Date. Now calculates
             minimum, maximum and median for this class",
             caption.lot = "atable with added methods for class Date",
             rowname = NULL)

