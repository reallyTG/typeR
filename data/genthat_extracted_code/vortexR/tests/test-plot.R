library(vortexR)
library(vortexRdata)
context("test plots")


test_that("test dot_plot", {
    data(pac.clas)
    dot <- dot_plot(data=pac.clas,
                    project="Pacioni_et_al",
                    scenario="ST_Classic",
                    yrs=c(80, 120),
                    params=c("PExtinct", "Nextant", "Het", "Nalleles"),
                    save2disk=FALSE)

  expect_length(dot , 4)
  expect_is(dot,"list")
  expect_is(dot[[1]], c("gg", "ggplot"))
})

test_that("test line_plot", {
    data(pac.clas)
    lineplot.st.classic <- line_plot_year(data=pac.clas,
                                          project="Pacioni_et_al",
                                          scenario="ST_Classic",
                                          params=c("Nextant"),
                                          save2disk=FALSE)
    expect_length(lineplot.st.classic , 1)
    expect_is(lineplot.st.classic, "list")
    expect_is(lineplot.st.classic[[1]], c("gg", "ggplot"))
})

test_that("test line_plot_mid", {
    data(pac.clas)
    lineMidPlot.st.classic <- line_plot_year_mid(data=pac.clas,
                                                 project="Pacioni_et_al",
                                                 scenario="ST_Classic",
                                                 yrmid=50,
                                                 params=c("Nextant"),
                                                 save2disk=FALSE)
    expect_length(lineMidPlot.st.classic , 1)
    expect_is(lineMidPlot.st.classic,"list")
    expect_is(lineMidPlot.st.classic[[1]], c("gg", "ggplot"))
})

test_that("test m_scatter", {
    # Using Pacioni et al. example data. See ?pac.lhs for more details.
    data(pac.lhs)
    # Remove base scenario
    pac.lhs.no.base <- pac.lhs[!pac.lhs$scen.name == "ST_LHS(Base)", ]

    # Use function lookup_table to obtain correct parameter values at year 0
    lkup.ST_LHS <- lookup_table(data=pac.lhs.no.base,
                                project="Pacioni_et_al",
                                scenario="ST_LHS",
                                pop="Population 1",
                                SVs=c("SV1", "SV2", "SV3", "SV4", "SV5", "SV6",
                                      "SV7"),
                                save2disk=FALSE)

    scatter.plot <- m_scatter(data=pac.lhs.no.base[1:33], data_type="dat",
                              lookup=lkup.ST_LHS, yr=120, popn=1, param="Nall",
                              vs=c("SV1", "SV2", "SV3"),
                              save2disk=FALSE)

    expect_is(scatter.plot, c("gg", "ggmatrix"))

})
