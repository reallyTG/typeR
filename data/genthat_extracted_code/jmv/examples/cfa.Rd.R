library(jmv)


### Name: cfa
### Title: Confirmatory Factor Analysis
### Aliases: cfa

### ** Examples

data <- lavaan::HolzingerSwineford1939

jmv::cfa(
    data = data,
    factors = list(
        list(label="Visual", vars=c("x1", "x2", "x3")),
        list(label="Textual", vars=c("x4", "x5", "x6")),
        list(label="Speed", vars=c("x7", "x8", "x9"))),
    resCov = NULL)

#
#  CONFIRMATORY FACTOR ANALYSIS
#
#  Factor Loadings
#  -----------------------------------------------------------------
#    Factor     Indicator    Estimate    SE        Z        p
#  -----------------------------------------------------------------
#    Visual     x1              0.900    0.0832    10.81    < .001
#               x2              0.498    0.0808     6.16    < .001
#               x3              0.656    0.0776     8.46    < .001
#    Textual    x4              0.990    0.0567    17.46    < .001
#               x5              1.102    0.0626    17.60    < .001
#               x6              0.917    0.0538    17.05    < .001
#    Speed      x7              0.619    0.0743     8.34    < .001
#               x8              0.731    0.0755     9.68    < .001
#               x9              0.670    0.0775     8.64    < .001
#  -----------------------------------------------------------------
#
#
#  FACTOR ESTIMATES
#
#  Factor Covariances
#  --------------------------------------------------------------
#                          Estimate    SE        Z       p
#  --------------------------------------------------------------
#    Visual     Visual      1.000 a
#               Textual     0.459      0.0635    7.22    < .001
#               Speed       0.471      0.0862    5.46    < .001
#    Textual    Textual     1.000 a
#               Speed       0.283      0.0715    3.96    < .001
#    Speed      Speed       1.000 a
#  --------------------------------------------------------------
#    a fixed parameter
#
#
#  MODEL FIT
#
#  Test for Exact Fit
#  ------------------------
#    X²      df    p
#  ------------------------
#    85.3    24    < .001
#  ------------------------
#
#
#  Fit Measures
#  -----------------------------------------------
#    CFI      TLI      RMSEA     Lower     Upper
#  -----------------------------------------------
#    0.931    0.896    0.0921    0.0714    0.114
#  -----------------------------------------------
#




