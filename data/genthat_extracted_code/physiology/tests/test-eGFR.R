context("eGFR")

test_that("creatinine_mgdl_to_uM", {
  expect_equal(creatinine_mgdl_to_uM(scr_mgdl = 1), 88.4017, tol = 0.0001)
  expect_warning(creatinine_mgdl_to_uM(scr_mgdl = 0.01))
})

test_that("Values that are likely to be already uM give a warning.", {
  expect_warning(creatinine_mgdl_to_uM(scr_mgdl = 80))
})

test_that("egfr expected errors", {
  expect_error(egfr())
  expect_error(egfr(scr_uM = 1))
  expect_error(egfr(age_y = 1))
  expect_error(egfr(scr_uM = 1, age_y = 1, height_m = 1))
  expect_error(egfr(scr_uM = 1, age_y = 1, height_m = 1, male = TRUE))
})

test_that("egfr automatic selection", {
  suppressWarnings({
    mdrd <- egfr_mdrd(
      scr_uM = rep(240, 4),
      age_y = rep(60, 4),
      male = c(TRUE, TRUE, FALSE, FALSE),
      black = c(TRUE, FALSE, TRUE, FALSE)
    )
    egfr_auto <- egfr(
      scr_uM = c(rep(80, 8), rep(240, 4)),
      age_y = c(rep(1, 4), rep(60, 8)),
      height_m = rep(1, 12),
      male = rep(c(TRUE, TRUE, FALSE, FALSE), 3),
      black = rep(c(TRUE, FALSE, TRUE, FALSE), 3)
    )
  })
  expect_equal(
    egfr_auto,
    c(
      egfr_bedside_schwartz(
        scr_uM = rep(80, 4),
        height_m = rep(1, 4)
      ),
      egfr_ckdepi(
        scr_uM = rep(80, 4),
        age_y = rep(60, 4),
        male = c(TRUE, TRUE, FALSE, FALSE),
        black = c(TRUE, FALSE, TRUE, FALSE)
      ),
      mdrd
    ),
    info = "eGFR method selection chooses the correct method for the data."
  )
})

test_that("egfr combination of MDRD and CKD-EPI", {
  suppressWarnings(
    mdrd <- egfr_mdrd(scr_uM = 120, age_y = 75, male = TRUE, black = TRUE)
  )
  expect_equal(
    expect_warning(
      egfr(scr_uM = 120, age_y = 75, height_m = 1, male = TRUE, black = TRUE),
      regexp = "neither"),
    mean(
      c(
        egfr_ckdepi(scr_uM = 120, age_y = 75, male = TRUE, black = TRUE,
                    warn_mdrd_preferred = FALSE),
        mdrd
      )
    ),
    info = "Neither value preferred, use the average"
  )
  expect_equal(
    expect_warning(
      egfr(scr_uM = 140, age_y = 20, height_m = 1, male = TRUE, black = FALSE),
      regexp = "both"
    ),
    mean(
      c(
        egfr_ckdepi(scr_uM = 140, age_y = 20, male = TRUE, black = FALSE,
                    warn_mdrd_preferred = FALSE),
        egfr_mdrd(scr_uM = 140, age_y = 20, male = TRUE, black = FALSE)
      )
    ),
    info = "Both value preferred, use the average"
  )
})

test_that("egfr_bedside_schwartz", {
  expect_equal(egfr_bedside_schwartz(scr_uM = 80, height_m = 1),
               36.2 * 100 / 80)
  expect_warning(egfr_bedside_schwartz(scr_uM = 1, height_m = 1))
  expect_warning(egfr_bedside_schwartz(scr_uM = 80, height_m = 100))
})

test_that("Ensure all 4 combinations of male / black work with egfr_ckdepi", {
  expect_equal(
    egfr_ckdepi(scr_uM = 80, age_y = 20, male = TRUE, black = TRUE),
    141 *
      min(80 / 79.6, 1) ^ (-0.411) *
      max(80 / 79.6, 1) ^ (-1.209) *
      0.993 ^ 20 *
      1 *
      1.159
  )
  expect_equal(
    egfr_ckdepi(scr_uM = 80, age_y = 20, male = TRUE, black = FALSE),
    141 *
      min(80 / 79.6, 1) ^ (-0.411) *
      max(80 / 79.6, 1) ^ (-1.209) *
      0.993 ^ 20 *
      1 *
      1
  )
  expect_equal(
    egfr_ckdepi(scr_uM = 80, age_y = 20, male = FALSE, black = TRUE),
    141 *
      min(80 / 61.9, 1) ^ (-0.329) *
      max(80 / 61.9, 1) ^ (-1.209) *
      0.993 ^ 20 *
      1.018 *
      1.159
  )
  expect_equal(
    egfr_ckdepi(scr_uM = 80, age_y = 20, male = FALSE, black = FALSE),
    141 *
      min(80 / 61.9, 1) ^ (-0.329) *
      max(80 / 61.9, 1) ^ (-1.209) *
      0.993 ^ 20 *
      1.018 *
      1
  )
})

test_that("Combinations of vector inputs for egfr_ckdepi", {
  # Same male / female, black / not black
  expect_equal(
    egfr_ckdepi(scr_uM = c(80, 60), age_y = c(20, 20), male = c(TRUE, TRUE),
                black = c(TRUE, TRUE)),
    141 *
      c(1, 60 / 79.6) ^ (-0.411) * # male
      c(80 / 79.6, 1) ^ (-1.209) * # male
      1 * # male
      0.993 ^ 20 *
      1.159 # black
  )
  expect_equal(
    egfr_ckdepi(scr_uM = c(80, 60), age_y = c(20, 20), male = c(FALSE, FALSE),
                black = c(TRUE, TRUE)),
    141 *
      c(1, 60 / 61.9) ^ (-0.329) * # female
      c(80 / 61.9, 1) ^ (-1.209) * # female
      1.018 * # female
      0.993 ^ 20 *
      1.159 # black
  )
  expect_equal(
    egfr_ckdepi(scr_uM = c(80, 60), age_y = c(20, 20), male = c(TRUE, TRUE),
                black = c(FALSE, FALSE)),
    141 *
      c(1, 60 / 79.6) ^ (-0.411) * # male
      c(80 / 79.6, 1) ^ (-1.209) * # male
      1 * # male
      0.993 ^ 20 *
      1 # not black
  )
  expect_equal(
    egfr_ckdepi(scr_uM = c(80, 60), age_y = c(20, 20), male = c(TRUE, TRUE),
                black = c(FALSE, FALSE)),
    141 *
      c(1, 60 / 79.6) ^ (-0.411) * # male
      c(80 / 79.6, 1) ^ (-1.209) * # male
      1 * # male
      0.993 ^ 20 *
      1 # not black
  )

  # Different male / female, same black / not black
  expect_equal(
    egfr_ckdepi(scr_uM = c(80, 60), age_y = c(20, 20), male = c(TRUE, FALSE),
                black = c(TRUE, TRUE)),
    141 *
      c(1, 60 / 61.9) ^ c(-0.411, -0.329) *
      c(80 / 79.6, 1) ^ (-1.209) *
      c(1, 1.018) *
      0.993 ^ 20 *
      1.159 # black
  )
  expect_equal(
    egfr_ckdepi(scr_uM = c(80, 60), age_y = c(20, 20), male = c(FALSE, TRUE),
                black = c(FALSE, FALSE)),
    141 *
      c(1, 60 / 79.6) ^ c(-0.329, -0.411) *
      c(80 / 61.9, 1) ^ (-1.209) *
      c(1.018, 1) *
      0.993 ^ 20 *
      1 # not black
  )

  # Same male / female, different black / not black
  expect_equal(
    egfr_ckdepi(scr_uM = c(80, 60), age_y = c(20, 20), male = c(TRUE, TRUE),
                black = c(FALSE, TRUE)),
    141 *
      c(1, 60 / 79.6) ^ (-0.411) * # male
      c(80 / 79.6, 1) ^ (-1.209) * # male
      1 * # male
      0.993 ^ 20 *
      c(1, 1.159)
  )
  expect_equal(
    egfr_ckdepi(scr_uM = c(80, 60), age_y = c(20, 20), male = c(TRUE, TRUE),
                black = c(TRUE, FALSE)),
    141 *
      c(1, 60 / 79.6) ^ (-0.411) * # male
      c(80 / 79.6, 1) ^ (-1.209) * # male
      1 * # male
      0.993 ^ 20 *
      c(1.159, 1)
  )
})


test_that("egfr_cockcroft_gault", {
  expect_warning(
    egfr_cockcroft_gault(scr_uM = 80, age_y = 20, weight_kg = 70, male = TRUE,
                         idms_assay = FALSE),
    regexp = "not recommended",
    info = "Cockcroft-Gault is never recommended"
  )
  expect_equal(
    expect_warning(egfr_cockcroft_gault(scr_uM = 80, age_y = 20, weight_kg = 70,
                                        male = TRUE)),
    (140 - 20) *
      70 *
      1 / # male
      #0.85 / # female
      (72 * 113.12 / 10000 * 80)
  )
  expect_equal(
    expect_warning(egfr_cockcroft_gault(scr_uM = 80, age_y = 20, weight_kg = 70,
                                        male = FALSE)),
    (140 - 20) *
      70 *
      #1 / # male
      0.85 / # female
      (72 * 113.12 / 10000 * 80)
  )
  expect_equal(
    expect_warning(
      egfr_cockcroft_gault(scr_uM = c(80, 80), age_y = c(20, 20),
                           weight_kg = c(70, 70), male = c(FALSE, TRUE))),
    (140 - 20) *
      70 *
      c(0.85, 1) /
      (72 * 113.12 / 10000 * 80)
  )
})

test_that("egfr_mdrd warning about output range", {
  expect_warning(
    egfr_mdrd(
      scr_uM = 80,
      age_y = 20,
      male = TRUE,
      black = TRUE,
      idms_assay = TRUE,
      warn_ckdepi_preferred = TRUE
    ),
    regexp = "CKD-EPI is recommended",
    fixed = TRUE
  )
  expect_silent(
    egfr_mdrd(
      scr_uM = 80,
      age_y = 20,
      male = TRUE,
      black = TRUE,
      idms_assay = TRUE,
      warn_ckdepi_preferred = FALSE
    )
  )
})

test_that("egfr_mdrd scalar accuracy", {
  expect_equal(
    egfr_mdrd(
      scr_uM = 240,
      age_y = 20,
      male = TRUE,
      black = TRUE,
      idms_assay = TRUE,
      warn_ckdepi_preferred = TRUE
    ),
    32788 *
      175 / 186 * # idms
      # 1 * # not idms
      240 ^ (-1.154) *
      20 ^ (-0.203) *
      1.212 * # black
      # 1 * # not black
      1 # male
    # 0.742 # female
  )
  expect_equal(
    egfr_mdrd(
      scr_uM = 240,
      age_y = 20,
      male = FALSE,
      black = TRUE,
      idms_assay = TRUE,
      warn_ckdepi_preferred = TRUE
    ),
    32788 *
      175 / 186 * # idms
      # 1 * # not idms
      240 ^ (-1.154) *
      20 ^ (-0.203) *
      1.212 * # black
      # 1 * # not black
      #1 # male
      0.742 # female
  )
  expect_equal(
    egfr_mdrd(
      scr_uM = 240,
      age_y = 20,
      male = TRUE,
      black = FALSE,
      idms_assay = TRUE,
      warn_ckdepi_preferred = TRUE
    ),
    32788 *
      175 / 186 * # idms
      # 1 * # not idms
      240 ^ (-1.154) *
      20 ^ (-0.203) *
      # 1.212 * # black
      1 * # not black
      1 # male
    # 0.742 # female
  )
  expect_equal(
    egfr_mdrd(
      scr_uM = 240,
      age_y = 20,
      male = TRUE,
      black = TRUE,
      idms_assay = FALSE,
      warn_ckdepi_preferred = TRUE
    ),
    32788 *
      # 175 / 186 * # idms
      1 * # not idms
      240 ^ (-1.154) *
      20 ^ (-0.203) *
      1.212 * # black
      # 1 * # not black
      1 # male
    # 0.742 # female
  )
})

test_that("egfr calcs warn or adjust correctly with IDMS-calibrated assays", {
  expect_warning(
    egfr_bedside_schwartz(scr_uM = 80, height_m = 1, idms_assay = FALSE),
    regexp = "IDMS"
  )
  expect_silent(
    egfr_bedside_schwartz(scr_uM = 80, height_m = 1, idms_assay = TRUE)
  )
  expect_warning(
    egfr_ckdepi(scr_uM = 80, age_y = 20, male = TRUE, black = TRUE,
                idms_assay = FALSE),
    regexp = "IDMS"
  )
  expect_silent(
    egfr_ckdepi(scr_uM = 80, age_y = 20, male = TRUE, black = TRUE,
                idms_assay = TRUE)
  )
  expect_warning(
    egfr_cockcroft_gault(scr_uM = 80, age_y = 20, weight_kg = 70, male = TRUE),
    regexp = "IDMS"
  )
  expect_warning(
    egfr_cockcroft_gault(scr_uM = 80, age_y = 20, weight_kg = 70, male = TRUE,
                         idms_assay = FALSE),
    regexp = "not recommended",
    all = TRUE
  )
  expect_silent(
    egfr_mdrd(scr_uM = 240, age_y = 20, male = TRUE, black = TRUE,
              idms_assay = TRUE)
  )
  expect_silent(
    egfr_mdrd(scr_uM = 240, age_y = 20, male = TRUE, black = TRUE,
              idms_assay = FALSE)
  )
  expect_true(
    egfr_mdrd(scr_uM = 240, age_y = 20, male = TRUE, black = TRUE,
              idms_assay = TRUE) !=
      egfr_mdrd(scr_uM = 240, age_y = 20, male = TRUE, black = TRUE,
                idms_assay = FALSE)
  )
})
