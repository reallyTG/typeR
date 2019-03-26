context("Plots")

test_that("plot_QC_out returns a ggplot object", {
  g<-QuantumClone::plot_QC_out(QC_output,Sample_names = c("Diag","Relapse"))
  expect_identical(class(g),c("gg","ggplot"))
}
)

test_that("evolution_plot returns a ggplot object", {
  g<-QuantumClone::evolution_plot(QC_output,Sample_names = c("Diag","Relapse"))
  expect_identical(class(g),c("gg","ggplot"))
}
)
test_that("plot_with_margins_densities returns a dridExtra object", {
  g<-suppressWarnings(QuantumClone::plot_with_margins_densities(QC_output))
  expect_identical(class(g),c("gtable","gTree","grob","gDesc"))
}
)

test_that("plot_QC_out returns a ggplot object single sample - also uses QuantumCat, QuantumClone, DEoptim and fpc", {
  set.seed(123)
  QCat<-QuantumCat(number_of_clones = 2,number_of_mutations = 40,ploidy = "AB",number_of_samples = 1,depth = 100)
  QC<-QuantumClone(QCat,contamination = 0, nclone_range = 2, 
                   save_plot = FALSE, optim = "DEoptim",
                   Init =1 ,epsilon = 0.05,
                   preclustering = "fpc") 
  g<-QuantumClone::plot_QC_out(QC,Sample_names = c("Diag"),sample_selected = 1)
  expect_identical(class(g),c("gg","ggplot"))
  expect_identical(Compute_NMI(QC),1)
}
)

test_that("multiplot_trees works",{
  plot<-multiplot_trees(QuantumClone::Tree, d= 4)
  expect_identical(class(plot),
                   "NULL"
  )
}
)
