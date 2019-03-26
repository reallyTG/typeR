context("Results structures")

test_that("make_results_row()"
  , {
    testthat::skip_on_cran()
    
    EQN_FILE <- system.file("extdata", "prospective_memory.eqn", package = "MPTmultiverse")
    DATA_FILE <- system.file("extdata", "smith_et_al_2011.csv", package = "MPTmultiverse")
    
    data <- read.csv(DATA_FILE, fileEncoding = "UTF-8-BOM")
    data <- data[c(1:5, 113:118),]
    COL_CONDITION <- "WM_EX"
    data[[COL_CONDITION]] <- as.character(factor(
      data[[COL_CONDITION]]
      , levels = 1:2
      , labels = c("low_WM", "high_WM")
    ))
    data$id <- as.character(1:nrow(data))
    capture_output(mpt_options("test"))
    
    object <- MPTmultiverse:::make_results_row(
      model = EQN_FILE
      , dataset = DATA_FILE
      , pooling = "partial"
      , package = "TreeBUGS"
      , method = "trait"
      , data = data
      # , parameters = c("test1", "test2", "test3")
      , id = "id"
      , condition = "WM_EX"
      , core = c("C1", "C2")
    )
    
    # check column names
    expect_identical(
      object = colnames(object)
      , expected = c(
        "model"
        , "dataset"
        , "pooling"
        , "package"
        , "method"
        , "est_group"
        , "est_indiv"
        , "est_rho"
        , "test_between"
        , "gof"
        , "gof_group"
        , "gof_indiv"
        , "fungibility"
        , "test_homogeneity"
        , "convergence"
        , "estimation"
        , "options"
      )
    )
    
    # Extract column classes
    column_classes <- lapply(X = object[, -c(1:5)], FUN = function(x) {
      lapply(X = x[[1]], FUN = class)
    })
    
    expect_identical(
      column_classes$est_group
      , expected = list(
        condition = "character"
        , parameter = "character"
        , core = "logical"
        , est = "numeric"
        , se = "numeric"
        , ci_0.025 = "numeric"
        , ci_0.1 = "numeric"
        , ci_0.9 = "numeric"
        , ci_0.975 = "numeric"
      )
    )
    
    expect_identical(
      column_classes$est_group
      , expected = list(
        condition = "character"
        , parameter = "character"
        , core = "logical"
        , est = "numeric"
        , se = "numeric"
        , ci_0.025 = "numeric"
        , ci_0.1 = "numeric"
        , ci_0.9 = "numeric"
        , ci_0.975 = "numeric"
      )
    )
    
    expect_identical(
      column_classes$est_indiv
      , expected = list(
        id = "character"
        , condition = "character"
        , parameter = "character"
        , core = "logical"
        , est = "numeric"
        , se = "numeric"
        , ci_0.025 = "numeric"
        , ci_0.1 = "numeric"
        , ci_0.9 = "numeric"
        , ci_0.975 = "numeric"
        , identifiable = "logical"
      )
    )
    
    expect_identical(
      column_classes$est_rho
      , expected = list(
        parameter1 = "character"
        , parameter2 = "character"
        , core1 = "logical"
        , core2 = "logical"
        , condition = "character"
        , est = "numeric"
        , se = "numeric"
        , p = "numeric"
        , ci_0.025 = "numeric"
        , ci_0.1 = "numeric"
        , ci_0.9 = "numeric"
        , ci_0.975 = "numeric"
      )
    )
    
    expect_identical(
      column_classes$test_between
      , expected = list(
        parameter = "character"
        , core = "logical"
        , condition1 = "character"
        , condition2 = "character"
        , est_diff = "numeric"
        , se = "numeric"
        , p = "numeric"
        , ci_0.025 = "numeric"
        , ci_0.1 = "numeric"
        , ci_0.9 = "numeric"
        , ci_0.975 = "numeric"
      )
    )
    
    expect_identical(
      column_classes$gof
      , expected = list(
        type = "character"
        , focus = "character"
        , stat_obs = "numeric"
        , stat_pred = "numeric"
        , stat_df = "numeric"
        , p = "numeric"
      )
    )
    
    expect_identical(
      column_classes$gof_group
      , expected = list(
        condition = "character"
        , type = "character"
        , focus = "character"
        , stat_obs = "numeric"
        , stat_pred = "numeric"
        , stat_df = "numeric"
        , p = "numeric"
      )
    )
    
    expect_identical(
      column_classes$gof_indiv
      , expected = list(
        id = "character"
        , condition = "character"
        , type = "character"
        , focus = "character"
        , stat_obs = "numeric"
        , stat_pred = "numeric"
        , stat_df = "numeric"
        , p = "numeric"
      )
    )
    
    expect_identical(
      column_classes$fungibility
      , expected = list(
        parameter1 = "character"
        , parameter2 = "character"
        , core1 = "logical"
        , core2 = "logical"
        , condition = "character"
        , correlation = "numeric"
      )
    )
    
    expect_identical(
      column_classes$test_homogeneity
      , expected = list(
        condition = "character"
        , chisq = "numeric"
        , df = "numeric"
        , p = "numeric"
      )
    )
    
    expect_identical(
      column_classes$estimation
      , expected = list(
        condition = "character"
        , time_difference = "difftime"
      )
    )
    
    # column `convergence` is initialized as an empty list, so missing here
    
    expect_identical(
      column_classes$options
      , expected = list(
        bootstrap_samples = "numeric"
        , n.optim = "numeric"
        , n.chains = "numeric"
        , n.iter = "numeric"
        , n.adapt = "numeric"
        , n.burnin = "numeric"
        , n.thin = "numeric"
        , Rhat_max = "numeric"
        , Neff_min = "numeric"
        , extend_max = "numeric"
        , n.PPP = "numeric"
        , ci_size = "list"
        , max_ci_indiv = "numeric"
      )
    )
    
    
  }
)