library(solvebio)
context("Local client environments")

source("./helpers.R", local=T)

bad_env <- solvebio::createEnv("bad")
# NOTE: good_env only works if assert_api_key()
good_env <- solvebio::createEnv(solvebio:::.solveEnv$token)


test_that("createEnv properly sets defaults", {
              env <- solvebio::createEnv("token")
              expect_equal(env$token, "token")
              expect_equal(env$token_type, "Token")
              expect_equal(env$host, "https://api.solvebio.com")
})

test_that("A default env is created", {
              assert_api_key()

              env <- solvebio:::.solveEnv
              expect_equal(env$token, Sys.getenv('SOLVEBIO_API_KEY'))
})

test_that("Simple functions work with global and local envs", {
              assert_api_key()

              # Global env should work
              user <- User.retrieve()
              expect_equal(user$email, "test@solvebio.com")

              # Local env should error
              expect_error(User.retrieve(env=bad_env), ".*401.*")

              # Local env with global's token should work
              user <- User.retrieve(env=good_env)
              expect_equal(user$email, "test@solvebio.com")
})

test_that("Functions with ellipsis work with global and local envs", {
              assert_api_key()

              # Global env
              res <- Object.all(limit=1)
              expect_equal(nrow(res$data), 1)

              # Local bad env
              expect_error(Object.all(env=bad_env), ".*401.*")

              # Local good env
              res <- Object.all(env=good_env)
              expect_equal(nrow(res$data), 10)

})

test_that("Functions with env arguments can be called out of order", {
              assert_api_key()

              # Local bad env
              expect_error(Object.all(limit=1, env=bad_env), ".*401.*")
              expect_error(Object.all(env=bad_env, limit=1), ".*401.*")

              # Local good env
              res <- Object.all(limit=1, env=good_env)
              expect_equal(nrow(res$data), 1)
              res <- Object.all(env=good_env, limit=1)
              expect_equal(nrow(res$data), 1)

              obj <- res$data
              new_obj <- Object.get_by_path(obj$path, good_env, vault_id=obj$vault_id)
              expect_equal(obj, new_obj)
              new_obj <- Object.get_by_path(obj$path, env=good_env, vault_id=obj$vault_id)
              expect_equal(obj, new_obj)
              new_obj <- Object.get_by_path(env=good_env, vault_id=obj$vault_id, path=obj$path)
              expect_equal(obj, new_obj)

              expect_error(Object.get_by_path(obj$path, bad_env, vault_id=obj$vault_id), ".*401.*")
              expect_error(Object.get_by_path(obj$path, env=bad_env, vault_id=obj$vault_id), ".*401.*")
              expect_error(Object.get_by_path(env=bad_env, vault_id=obj$vault_id, path=obj$path), ".*401.*")
})

test_that("do.call works with env argument", {
              assert_api_key()

              # Simple functions
              user <- do.call(User.retrieve, c(good_env))
              expect_equal(user$email, "test@solvebio.com")
              expect_error(do.call(User.retrieve, c(bad_env)), ".*401.*")

              # Functions with ellipsis
              res <- do.call(Object.all, list(limit=1))
              expect_equal(nrow(res$data), 1)

              # Local bad env
              expect_error(do.call(Object.all, list(env=bad_env)), ".*401.*")
              expect_error(do.call(Object.all, list(limit=1, env=bad_env)), ".*401.*")
              expect_error(do.call(Object.all, list(env=bad_env, limit=1)), ".*401.*")

              # Local good env
              res <- do.call(Object.all, list(limit=1, env=good_env))
              expect_equal(nrow(res$data), 1)
              res <- do.call(Object.all, list(env=good_env, limit=1))
              expect_equal(nrow(res$data), 1)
              res <- do.call(Object.all, list(env=good_env))
              expect_equal(nrow(res$data), 10)
})
