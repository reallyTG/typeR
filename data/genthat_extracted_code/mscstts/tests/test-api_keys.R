context("Testing API Keys")

##################################
# Remove all Keys
##################################
ms_tts_key = getOption("ms_tts_key")
options(ms_tts_key = NULL)
get_key = function(x) {
  x = Sys.getenv(x)
  if (is.null(x)) {
    return(x)
  }
  if (x == "") {
    return(NULL)
  }
  return(x)
}
keys = c("MS_TTS_API_KEY",
         "MS_TTS_API_KEY1", "MS_TTS_API_KEY2")
env_keys = lapply(keys, get_key)
names(env_keys) = keys

rm_keys = lapply(env_keys, function(x) "")
do.call("Sys.setenv", args = rm_keys)


test_that(desc = "Making sure if API key is unset, then error", {
  skip_on_cran()

  expect_error(get_ms_tts_key(error = TRUE))
  expect_false(have_ms_tts_key())
  expect_false(valid_ms_tts_key())
  expect_null(get_ms_tts_key(error = FALSE))

})


# reset_keys
nonull = !sapply(env_keys, is.null)
run_env_keys = env_keys[nonull]
if (any(nonull)) {
  do.call("Sys.setenv", args = run_env_keys)
}
options(ms_tts_key = ms_tts_key)
