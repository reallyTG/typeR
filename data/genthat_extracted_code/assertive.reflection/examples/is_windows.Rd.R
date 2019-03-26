library(assertive.reflection)


### Name: assert_is_64_bit_os
### Title: What OS is running?
### Aliases: assert_is_32_bit assert_is_64_bit assert_is_64_bit_os
###   assert_is_bsd assert_is_linux assert_is_mac assert_is_macos_sierra
###   assert_is_osx assert_is_osx_cheetah assert_is_osx_el_capitan
###   assert_is_osx_jaguar assert_is_osx_leopard assert_is_osx_lion
###   assert_is_osx_mavericks assert_is_osx_mountain_lion
###   assert_is_osx_panther assert_is_osx_puma assert_is_osx_snow_leopard
###   assert_is_osx_tiger assert_is_osx_yosemite assert_is_solaris
###   assert_is_unix assert_is_windows assert_is_windows_10
###   assert_is_windows_7 assert_is_windows_8 assert_is_windows_8.1
###   assert_is_windows_server_2008 assert_is_windows_server_2008_r2
###   assert_is_windows_server_2012 assert_is_windows_server_2012_r2
###   assert_is_windows_vista is_32_bit is_64_bit is_64_bit_os is_bsd
###   is_linux is_mac is_macos_sierra is_osx is_osx_cheetah
###   is_osx_el_capitan is_osx_jaguar is_osx_leopard is_osx_lion
###   is_osx_mavericks is_osx_mountain_lion is_osx_panther is_osx_puma
###   is_osx_snow_leopard is_osx_tiger is_osx_yosemite is_solaris is_unix
###   is_windows is_windows_10 is_windows_7 is_windows_8 is_windows_8.1
###   is_windows_server_2008 is_windows_server_2008_r2
###   is_windows_server_2012 is_windows_server_2012_r2 is_windows_vista

### ** Examples

is_unix()
is_linux()
is_bsd()
is_solaris()
if(is_windows())
{
  assertive.base::dont_stop({
    assert_is_windows_vista()
    assert_is_windows_7()
    assert_is_windows_8()
    assert_is_windows_8.1()
    assert_is_windows_10()
    assert_is_windows_server_2008()
    assert_is_windows_server_2008_r2()
    assert_is_windows_server_2012()
    assert_is_windows_server_2012_r2()
  })
}
if(is_osx()) # is_mac is a synonym
{
  assertive.base::dont_stop({
    assert_is_osx_cheetah()
    assert_is_osx_puma()
    assert_is_osx_jaguar()
    assert_is_osx_panther()
    assert_is_osx_tiger()
    assert_is_osx_leopard()
    assert_is_osx_snow_leopard()
    assert_is_osx_lion()
    assert_is_osx_mountain_lion()
    assert_is_osx_mavericks()
    assert_is_osx_yosemite()
    assert_is_osx_el_capitan()
    assert_is_macos_sierra() # note the change from OSX to macOS
  })
}
is_32_bit()
is_64_bit()
assertive.base::dont_stop(assert_is_windows())
assertive.base::dont_stop(assert_is_unix())



