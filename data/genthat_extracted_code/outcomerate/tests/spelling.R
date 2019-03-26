cond <- identical(Sys.getenv("TRAVIS"), "true")
spelling::spell_check_test(vignettes = TRUE, error = cond)
