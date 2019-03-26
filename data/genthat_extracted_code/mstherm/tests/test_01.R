library(mstherm)

Sys.unsetenv("R_TESTS") 

context("TPP modeling")

# Find demo project files
control <- system.file("extdata", "demo_project/control.tsv", package="mstherm")
annots  <- system.file("extdata", "demo_project/annots.tsv",  package="mstherm")

test_that("demo files are available", {
    expect_match(basename(control), "control.tsv")
    expect_match(basename(annots),  "annots.tsv")
})

# Build experiment
expt <- MSThermExperiment(control, annotations=annots)

test_that("MSThermExperiment creation", {
    expect_is(expt, "MSThermExperiment")
})

# Perform typical normalization
spike_in <- "cRAP_ALBU_BOVIN"
norm.std <- normalize_to_std(expt, spike_in, plot=T)

prof <- c(50.0, 50.5, 47.5, 42.0, 37.0, 25.0, 16.0, 11.5, 10.5, 10.0)
norm.prf <- expt
norm.prf$samples$Control$replicates$C1 <- normalize_to_profile(
    expt$samples$Control$replicates$C1,
    prof,
    plot=T
)
norm.prf$samples$Treated$replicates$T1 <- normalize_to_profile(
    expt$samples$Treated$replicates$T1,
    prof,
    plot=F
)

test_that("MSThermExperiment normalization", {
    expect_is(norm.std, "MSThermExperiment")
    expect_is(norm.prf, "MSThermExperiment")

    # intensities should be normalized
    expect_equal(expt$samples$Control$replicates$C1$data$TMT10.128N[6],
        2685251, tolerance=1)
    expect_equal(norm.std$samples$Control$replicates$C1$data$TMT10.126[6],
        2393289, tolerance=1)
    expect_equal(norm.prf$samples$Control$replicates$C1$data$TMT10.126[6],
        2378632, tolerance=1)
})

# Perform typical modeling
res0 <- model_experiment(norm.std, bootstrap=F, smooth=T, min_rep_psm=0, np=2, check_missing=F)
res1 <- model_experiment(norm.std, bootstrap=F, smooth=T, min_rep_psm=0, np=2, check_missing=T)
res2 <- model_experiment(norm.std, bootstrap=F, smooth=T, min_rep_psm=3, np=2)
res3 <- model_experiment(norm.std, bootstrap=T, smooth=F, min_rep_psm=3, np=2)
sgl0 <- res0$P38707
sgl1 <- res1$P38707
sgl2 <- res1$cRAP_ALBU_BOVIN
print(sgl1$series$C1$psm)

test_that("MSThermExperiment modeling", {
    expect_is(res1, "MSThermResultSet")
    expect_is(res2, "MSThermResultSet")
    expect_is(res3, "MSThermResultSet")
    expect_is(sgl0,  "MSThermResult")
    expect_is(sgl1,  "MSThermResult")
    expect_is(sgl2,  "MSThermResult")

    expect_equal(length(res1), 6)
    expect_equal(length(res2), 5)
    expect_equal(length(res3), 5)

    # protein that should have modeled well
    expect_match(sgl1$annotation, "Asparagine--tRNA ligase, cytoplasmic")
    expect_true(sgl1$series$C1$is.fitted)

    expect_equal(sgl1$series$C1$tm,    48.0,   tolerance=0.1)
    expect_equal(sgl1$series$C1$k,    842,     tolerance=2)
    expect_equal(sgl1$series$C1$plat,   0.06,  tolerance=0.01)
    expect_equal(sgl1$series$C1$slope, -0.090, tolerance=0.001)
    expect_equal(sgl1$series$C1$r2,     0.99,  tolerance=0.01)
    expect_equal(sgl1$series$C1$rmsd,   0.03,  tolerance=0.01)
    expect_equal(sgl1$series$C1$inf,    0.16,  tolerance=0.01)

    #  missing value check should remove one PSM
    expect_equal(sgl0$series$C1$psm,   46,     tolerance=0.01)
    expect_equal(sgl1$series$C1$psm,   45,     tolerance=0.01)

    expect_equal(sgl1$series$T1$tm,    52.1,   tolerance=0.1)
    expect_equal(sgl1$series$T1$k,    988,     tolerance=2)
    expect_equal(sgl1$series$T1$plat,   0.02,  tolerance=0.01)
    expect_equal(sgl1$series$T1$slope, -0.090, tolerance=0.001)
    expect_equal(sgl1$series$T1$r2,     0.99,  tolerance=0.01)
    expect_equal(sgl1$series$T1$rmsd,   0.04,  tolerance=0.01)
    expect_equal(sgl1$series$T1$inf,    0.20,  tolerance=0.01)
    expect_equal(sgl1$series$T1$psm,   92,     tolerance=0.01)

    # protein that should not have modeled at all
    expect_false(sgl2$series$C1$is.fitted)
    expect_equal(sgl2$series$C1$tm, NA)

})


# Perform secondary normalization
norm2 <- normalize_to_tm(norm.std, res2)
res2  <- model_experiment(norm2, bootstrap=F, smooth=T, min_rep_psm=3, np=2)

t1 <- norm.std$samples$Treated$replicates$T1$meta$temp[[5]]
t2 <- norm2$samples$Treated$replicates$T1$meta$temp[[5]]

test_that("MSThermExperiment secondary normalization", {
    expect_is(norm2, "MSThermExperiment")
    expect_equal( t1, 45.0, tolerance=0.1 )
    expect_equal( t2, 44.3, tolerance=0.1 )
})


# Perform export

res3.df <- as.data.frame(res3)

test_that("MSThermResult export", {

    expect_equal( nrow(res3.df), 5)
    expect_equal( ncol(res3.df), 17)

})

# Fake tests (TODO: how to test these properly)?

write.sqlite(res3, "tmp.sqlite")
plot(res3)
summary(sgl1)
summary(res3)
